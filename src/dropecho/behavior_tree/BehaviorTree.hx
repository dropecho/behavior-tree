package dropecho.behavior_tree;

import dropecho.behavior_tree.node.Node;

typedef Blackboard = Map<String, Dynamic>;

@:expose("bt.BehaviorTree")
class BehaviorTree implements Node {
	private var child:Node;
	private var context:Blackboard;

	public function new(root:Node = null) {
		if (root == null) {
			throw "Root cannot be null";
		}

		this.child = root;
	}

	public function init(context:Blackboard) {
		if (context == null) {
			context = new Blackboard();
		}

		this.context = context;
		child.init(this.context);
	}

	public function execute() {
		return this.child.execute();
	}
}
