
extension Sequence where Element: Hashable {
	/// Returns an array containing each element in `self` only once, in the same order.
	public func removeDuplicates () -> [Element] {
		var originals = Set<Element>(minimumCapacity: underestimatedCount)
		return self.filter { x in
			if originals.contains(x) {
				return false
			}
			originals.insert(x)
			return true
		}
	}
}
