class Loader():

    def __init__(data_type):
        self.data_type = data_type

    def load_bin(path, fill=0.0):
        with open(path, 'rb') as f:
            bb = f.read(4*4)
            # print(len(bb))
            v = struct.unpack('4i', bb)
            # print(v[0])
            bb = f.read(v[0]*4)
            v = struct.unpack("%df" % (v[0]), bb)
            feature = np.full((feature_dim+feature_ext,), fill, dtype=np.float32)
            feature[0:feature_dim] = v
            #feature = np.array( v, dtype=np.float32)
        # print(feature.shape)
        # print(np.linalg.norm(feature))
        return feature


    def load_np(path, fill=0.0):
        feature = np.load(path)
        feature = np.append(feature, np.array([fill], dtype=np.float32))
        return feature


    def load_mat(path, fill=0.0):
        feature = sio.loadmat(path)['feature']
        feature = np.append(feature, np.array([fill], dtype=np.float32))
        return feature
