package dropecho.behavior_tree.node.decorator;

import dropecho.behavior_tree.BehaviorTree.Blackboard;

class DecoratorNode implements Node {
	private var child:Node;
	private var context:Blackboard;

	public function new(child:Node) {
		this.child = child;
	}

	public function init(context:Blackboard) {
		this.context = context;
		if (this.child.init != null) {
			this.child.init(context);
		}
	}

	public function execute():NODE_STATUS {
		return NODE_STATUS.FAILURE;
	};
}
