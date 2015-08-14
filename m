From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: [PATCH v4 1/6] media: get rid of unused "extra_links" param on media_entity_init()
Date: Fri, 14 Aug 2015 11:56:38 -0300
Message-ID: <b0b576e0bfcc043b4fdab3a57665b525fc054add.1439563682.git.mchehab@osg.samsung.com>
References: <cover.1439563682.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <cover.1439563682.git.mchehab@osg.samsung.com>
In-Reply-To: <cover.1439563682.git.mchehab@osg.samsung.com>
References: <cover.1439563682.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Harry Wei <harryxiyou@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@iki.fi>, Lars-Peter Clausen <lars@metafoo.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kyungmin Park <kyungmin.park@samsung.com>, Heungjun Kim <riverful.kim@samsung.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Mats Randgaard <matrandg@cisco.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently, media_entity_init() creates an array with the links,
allocated at init time. It provides a parameter (extra_links)
that would allocate more links than the current needs, but this
is not used by any driver.

As we want to be able to do dynamic link allocation/removal,
we'll need to change the implementation of the links. So,
before doing that, let's first remove that extra unused
parameter, in order to cleanup the interface first.

Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

diff --git a/Documentation/media-framework.txt b/Documentation/media-fr=
amework.txt
index f552a75c0e70..2cc6019f7147 100644
--- a/Documentation/media-framework.txt
+++ b/Documentation/media-framework.txt
@@ -104,7 +104,7 @@ although drivers can allocate entities directly.
 Drivers initialize entities by calling
=20
 	media_entity_init(struct media_entity *entity, u16 num_pads,
-			  struct media_pad *pads, u16 extra_links);
+			  struct media_pad *pads);
=20
 The media_entity name, type, flags, revision and group_id fields can b=
e
 initialized before or after calling media_entity_init. Entities embedd=
ed in
diff --git a/Documentation/video4linux/v4l2-framework.txt b/Documentati=
on/video4linux/v4l2-framework.txt
index 75d5c18d689a..109cc3792534 100644
--- a/Documentation/video4linux/v4l2-framework.txt
+++ b/Documentation/video4linux/v4l2-framework.txt
@@ -300,7 +300,7 @@ calling media_entity_init():
 	struct media_pad *pads =3D &my_sd->pads;
 	int err;
=20
-	err =3D media_entity_init(&sd->entity, npads, pads, 0);
+	err =3D media_entity_init(&sd->entity, npads, pads);
=20
 The pads array must have been previously initialized. There is no need=
 to
 manually set the struct media_entity type and name fields, but the rev=
ision
@@ -700,7 +700,7 @@ calling media_entity_init():
 	struct media_pad *pad =3D &my_vdev->pad;
 	int err;
=20
-	err =3D media_entity_init(&vdev->entity, 1, pad, 0);
+	err =3D media_entity_init(&vdev->entity, 1, pad);
=20
 The pads array must have been previously initialized. There is no need=
 to
 manually set the struct media_entity type and name fields.
diff --git a/Documentation/zh_CN/video4linux/v4l2-framework.txt b/Docum=
entation/zh_CN/video4linux/v4l2-framework.txt
index 2b828e631e31..ff815cb92031 100644
--- a/Documentation/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/zh_CN/video4linux/v4l2-framework.txt
@@ -295,7 +295,7 @@ owner =E5=9F=9F=E3=80=82=E8=8B=A5=E4=BD=BF=E7=94=A8=
 i2c =E8=BE=85=E5=8A=A9=E5=87=BD=E6=95=B0=EF=BC=8C=E8=BF=99=E4=BA=9B=E9=
=83=BD=E4=BC=9A=E5=B8=AE=E4=BD=A0=E5=A4=84=E7=90=86=E5=A5=BD=E3=80=82
 	struct media_pad *pads =3D &my_sd->pads;
 	int err;
=20
-	err =3D media_entity_init(&sd->entity, npads, pads, 0);
+	err =3D media_entity_init(&sd->entity, npads, pads);
=20
 pads =E6=95=B0=E7=BB=84=E5=BF=85=E9=A1=BB=E9=A2=84=E5=85=88=E5=88=9D=E5=
=A7=8B=E5=8C=96=E3=80=82=E6=97=A0=E9=A1=BB=E6=89=8B=E5=8A=A8=E8=AE=BE=E7=
=BD=AE media_entity =E7=9A=84 type =E5=92=8C
 name =E5=9F=9F=EF=BC=8C=E4=BD=86=E5=A6=82=E6=9C=89=E5=BF=85=E8=A6=81=EF=
=BC=8Crevision =E5=9F=9F=E5=BF=85=E9=A1=BB=E5=88=9D=E5=A7=8B=E5=8C=96=E3=
=80=82
@@ -602,7 +602,7 @@ v4l2_file_operations =E7=BB=93=E6=9E=84=E4=BD=93=E6=
=98=AF file_operations =E7=9A=84=E4=B8=80=E4=B8=AA=E5=AD=90=E9=9B=86=E3=
=80=82=E5=85=B6=E4=B8=BB=E8=A6=81
 	struct media_pad *pad =3D &my_vdev->pad;
 	int err;
=20
-	err =3D media_entity_init(&vdev->entity, 1, pad, 0);
+	err =3D media_entity_init(&vdev->entity, 1, pad);
=20
 pads =E6=95=B0=E7=BB=84=E5=BF=85=E9=A1=BB=E9=A2=84=E5=85=88=E5=88=9D=E5=
=A7=8B=E5=8C=96=E3=80=82=E6=B2=A1=E6=9C=89=E5=BF=85=E8=A6=81=E6=89=8B=E5=
=8A=A8=E8=AE=BE=E7=BD=AE media_entity =E7=9A=84 type =E5=92=8C
 name =E5=9F=9F=E3=80=82
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/d=
vbdev.c
index 13bb57f0457f..2fdcbb5f000a 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -249,7 +249,7 @@ static void dvb_register_media_device(struct dvb_de=
vice *dvbdev,
 	}
=20
 	if (npads)
-		ret =3D media_entity_init(dvbdev->entity, npads, dvbdev->pads, 0);
+		ret =3D media_entity_init(dvbdev->entity, npads, dvbdev->pads);
 	if (!ret)
 		ret =3D media_device_register_entity(dvbdev->adapter->mdev,
 						   dvbdev->entity);
diff --git a/drivers/media/i2c/ad9389b.c b/drivers/media/i2c/ad9389b.c
index 69094ab047b1..39d6ee681aeb 100644
--- a/drivers/media/i2c/ad9389b.c
+++ b/drivers/media/i2c/ad9389b.c
@@ -1158,7 +1158,7 @@ static int ad9389b_probe(struct i2c_client *clien=
t, const struct i2c_device_id *
 	state->rgb_quantization_range_ctrl->is_private =3D true;
=20
 	state->pad.flags =3D MEDIA_PAD_FL_SINK;
-	err =3D media_entity_init(&sd->entity, 1, &state->pad, 0);
+	err =3D media_entity_init(&sd->entity, 1, &state->pad);
 	if (err)
 		goto err_hdl;
=20
diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index c70ababce954..5f76997f6e07 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -512,7 +512,7 @@ static int adp1653_probe(struct i2c_client *client,
 	if (ret)
 		goto free_and_quit;
=20
-	ret =3D media_entity_init(&flash->subdev.entity, 0, NULL, 0);
+	ret =3D media_entity_init(&flash->subdev.entity, 0, NULL);
 	if (ret < 0)
 		goto free_and_quit;
=20
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index f82c8aa164fa..bab91a1e1525 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1214,7 +1214,7 @@ static int adv7180_probe(struct i2c_client *clien=
t,
=20
 	state->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.flags |=3D MEDIA_ENT_T_V4L2_SUBDEV_DECODER;
-	ret =3D media_entity_init(&sd->entity, 1, &state->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &state->pad);
 	if (ret)
 		goto err_free_ctrl;
=20
diff --git a/drivers/media/i2c/adv7511.c b/drivers/media/i2c/adv7511.c
index ef198cee8969..992ac143a40b 100644
--- a/drivers/media/i2c/adv7511.c
+++ b/drivers/media/i2c/adv7511.c
@@ -1482,7 +1482,7 @@ static int adv7511_probe(struct i2c_client *clien=
t, const struct i2c_device_id *
 	state->rgb_quantization_range_ctrl->is_private =3D true;
=20
 	state->pad.flags =3D MEDIA_PAD_FL_SINK;
-	err =3D media_entity_init(&sd->entity, 1, &state->pad, 0);
+	err =3D media_entity_init(&sd->entity, 1, &state->pad);
 	if (err)
 		goto err_hdl;
=20
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 5631ec004eed..35fccf450870 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3209,7 +3209,7 @@ static int adv76xx_probe(struct i2c_client *clien=
t,
 	state->pads[state->source_pad].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	err =3D media_entity_init(&sd->entity, state->source_pad + 1,
-				state->pads, 0);
+				state->pads);
 	if (err)
 		goto err_work_queues;
=20
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index b7269b8f040d..3968d018135c 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3309,7 +3309,7 @@ static int adv7842_probe(struct i2c_client *clien=
t,
 			adv7842_delayed_work_enable_hotplug);
=20
 	state->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	err =3D media_entity_init(&sd->entity, 1, &state->pad, 0);
+	err =3D media_entity_init(&sd->entity, 1, &state->pad);
 	if (err)
 		goto err_work_queues;
=20
diff --git a/drivers/media/i2c/as3645a.c b/drivers/media/i2c/as3645a.c
index 301084b07887..9d579a836f79 100644
--- a/drivers/media/i2c/as3645a.c
+++ b/drivers/media/i2c/as3645a.c
@@ -827,7 +827,7 @@ static int as3645a_probe(struct i2c_client *client,
 	if (ret < 0)
 		goto done;
=20
-	ret =3D media_entity_init(&flash->subdev.entity, 0, NULL, 0);
+	ret =3D media_entity_init(&flash->subdev.entity, 0, NULL);
 	if (ret < 0)
 		goto done;
=20
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i=
2c/cx25840/cx25840-core.c
index fe6eb78b6914..270135d06b32 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -5211,7 +5211,7 @@ static int cx25840_probe(struct i2c_client *clien=
t,
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_DECODER;
=20
 	ret =3D media_entity_init(&sd->entity, ARRAY_SIZE(state->pads),
-				state->pads, 0);
+				state->pads);
 	if (ret < 0) {
 		v4l_info(client, "failed to initialize media entity!\n");
 		return ret;
diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index d9ece4b2d047..9bd9def0852c 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -365,7 +365,7 @@ static int lm3560_subdev_init(struct lm3560_flash *=
flash,
 	rval =3D lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
-	rval =3D media_entity_init(&flash->subdev_led[led_no].entity, 0, NULL=
, 0);
+	rval =3D media_entity_init(&flash->subdev_led[led_no].entity, 0, NULL=
);
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_FLA=
SH;
diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index 626fb4679c02..4160e18af607 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -282,7 +282,7 @@ static int lm3646_subdev_init(struct lm3646_flash *=
flash)
 	rval =3D lm3646_init_controls(flash);
 	if (rval)
 		goto err_out;
-	rval =3D media_entity_init(&flash->subdev_led.entity, 0, NULL, 0);
+	rval =3D media_entity_init(&flash->subdev_led.entity, 0, NULL);
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led.entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_FLASH;
diff --git a/drivers/media/i2c/m5mols/m5mols_core.c b/drivers/media/i2c=
/m5mols/m5mols_core.c
index 6404c0d93e7a..f718a1009e4c 100644
--- a/drivers/media/i2c/m5mols/m5mols_core.c
+++ b/drivers/media/i2c/m5mols/m5mols_core.c
@@ -975,7 +975,7 @@ static int m5mols_probe(struct i2c_client *client,
=20
 	sd->internal_ops =3D &m5mols_subdev_internal_ops;
 	info->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&sd->entity, 1, &info->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &info->pad);
 	if (ret < 0)
 		return ret;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
diff --git a/drivers/media/i2c/mt9m032.c b/drivers/media/i2c/mt9m032.c
index c7747bd0cabb..1493ab6e7fb3 100644
--- a/drivers/media/i2c/mt9m032.c
+++ b/drivers/media/i2c/mt9m032.c
@@ -799,7 +799,7 @@ static int mt9m032_probe(struct i2c_client *client,
=20
 	sensor->subdev.ctrl_handler =3D &sensor->ctrls;
 	sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&sensor->subdev.entity, 1, &sensor->pad, 0)=
;
+	ret =3D media_entity_init(&sensor->subdev.entity, 1, &sensor->pad);
 	if (ret < 0)
 		goto error_ctrl;
=20
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 0db15f528ac1..e3c5af82b7c1 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1112,7 +1112,7 @@ static int mt9p031_probe(struct i2c_client *clien=
t,
 	mt9p031->subdev.internal_ops =3D &mt9p031_subdev_internal_ops;
=20
 	mt9p031->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&mt9p031->subdev.entity, 1, &mt9p031->pad, =
0);
+	ret =3D media_entity_init(&mt9p031->subdev.entity, 1, &mt9p031->pad);
 	if (ret < 0)
 		goto done;
=20
diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
index 8ae99f7f254c..1dae1a98bc85 100644
--- a/drivers/media/i2c/mt9t001.c
+++ b/drivers/media/i2c/mt9t001.c
@@ -933,7 +933,7 @@ static int mt9t001_probe(struct i2c_client *client,
 	mt9t001->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
=20
 	mt9t001->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&mt9t001->subdev.entity, 1, &mt9t001->pad, =
0);
+	ret =3D media_entity_init(&mt9t001->subdev.entity, 1, &mt9t001->pad);
=20
 done:
 	if (ret < 0) {
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index a68ce94ee097..065659e98719 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1046,7 +1046,7 @@ static int mt9v032_probe(struct i2c_client *clien=
t,
 	mt9v032->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
=20
 	mt9v032->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&mt9v032->subdev.entity, 1, &mt9v032->pad, =
0);
+	ret =3D media_entity_init(&mt9v032->subdev.entity, 1, &mt9v032->pad);
 	if (ret < 0)
 		goto err;
=20
diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon01=
0pc30.c
index f197b6cbd407..a9761251b970 100644
--- a/drivers/media/i2c/noon010pc30.c
+++ b/drivers/media/i2c/noon010pc30.c
@@ -780,7 +780,7 @@ static int noon010_probe(struct i2c_client *client,
=20
 	info->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, 1, &info->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &info->pad);
 	if (ret < 0)
 		goto np_err;
=20
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 6edffc7b74e3..39f2d2cfdc9c 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1450,7 +1450,7 @@ static int ov2659_probe(struct i2c_client *client=
,
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	ov2659->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, 1, &ov2659->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &ov2659->pad);
 	if (ret < 0) {
 		v4l2_ctrl_handler_free(&ov2659->ctrls);
 		return ret;
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 2bc473385c91..6a6747343512 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1501,7 +1501,7 @@ static int ov965x_probe(struct i2c_client *client=
,
=20
 	ov965x->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, 1, &ov965x->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &ov965x->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i=
2c/s5c73m3/s5c73m3-core.c
index 53c5ea89f0b9..6d167428727d 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1691,7 +1691,7 @@ static int s5c73m3_probe(struct i2c_client *clien=
t,
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV;
=20
 	ret =3D media_entity_init(&sd->entity, S5C73M3_NUM_PADS,
-							state->sensor_pads, 0);
+							state->sensor_pads);
 	if (ret < 0)
 		return ret;
=20
@@ -1707,7 +1707,7 @@ static int s5c73m3_probe(struct i2c_client *clien=
t,
 	oif_sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV;
=20
 	ret =3D media_entity_init(&oif_sd->entity, OIF_NUM_PADS,
-							state->oif_pads, 0);
+							state->oif_pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.=
c
index 97084237275d..d207ddce31b6 100644
--- a/drivers/media/i2c/s5k4ecgx.c
+++ b/drivers/media/i2c/s5k4ecgx.c
@@ -962,7 +962,7 @@ static int s5k4ecgx_probe(struct i2c_client *client=
,
=20
 	priv->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, 1, &priv->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &priv->pad);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 774e0d0c94cb..30a9ca62e034 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1905,7 +1905,7 @@ static int s5k5baf_configure_subdevs(struct s5k5b=
af *state,
=20
 	state->cis_pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, NUM_CIS_PADS, &state->cis_pad,=
 0);
+	ret =3D media_entity_init(&sd->entity, NUM_CIS_PADS, &state->cis_pad)=
;
 	if (ret < 0)
 		goto err;
=20
@@ -1920,7 +1920,7 @@ static int s5k5baf_configure_subdevs(struct s5k5b=
af *state,
 	state->pads[PAD_CIS].flags =3D MEDIA_PAD_FL_SINK;
 	state->pads[PAD_OUT].flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV;
-	ret =3D media_entity_init(&sd->entity, NUM_ISP_PADS, state->pads, 0);
+	ret =3D media_entity_init(&sd->entity, NUM_ISP_PADS, state->pads);
=20
 	if (!ret)
 		return 0;
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index b1b1574dfb95..2434a7944781 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -333,7 +333,7 @@ static int s5k6a3_probe(struct i2c_client *client,
 	sensor->format.height =3D S5K6A3_DEFAULT_HEIGHT;
=20
 	sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	ret =3D media_entity_init(&sd->entity, 1, &sensor->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &sensor->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/i2c/s5k6aa.c b/drivers/media/i2c/s5k6aa.c
index d0ad6a25bdab..39a461f9d9bb 100644
--- a/drivers/media/i2c/s5k6aa.c
+++ b/drivers/media/i2c/s5k6aa.c
@@ -1578,7 +1578,7 @@ static int s5k6aa_probe(struct i2c_client *client=
,
=20
 	s5k6aa->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	sd->entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
-	ret =3D media_entity_init(&sd->entity, 1, &s5k6aa->pad, 0);
+	ret =3D media_entity_init(&sd->entity, 1, &s5k6aa->pad);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c=
/smiapp/smiapp-core.c
index 636ebd6fe5dc..308613ea0aed 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2488,7 +2488,7 @@ static int smiapp_register_subdevs(struct smiapp_=
sensor *sensor)
 			continue;
=20
 		rval =3D media_entity_init(&this->sd.entity,
-					 this->npads, this->pads, 0);
+					 this->npads, this->pads);
 		if (rval) {
 			dev_err(&client->dev,
 				"media_entity_init failed\n");
@@ -3078,7 +3078,7 @@ static int smiapp_probe(struct i2c_client *client=
,
=20
 	sensor->src->pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
 	rval =3D media_entity_init(&sensor->src->sd.entity, 2,
-				 sensor->src->pads, 0);
+				 sensor->src->pads);
 	if (rval < 0)
 		return rval;
=20
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.=
c
index 2e926317d7e9..6dc6c49a3622 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1877,7 +1877,7 @@ static int tc358743_probe(struct i2c_client *clie=
nt,
 	}
=20
 	state->pad.flags =3D MEDIA_PAD_FL_SOURCE;
-	err =3D media_entity_init(&sd->entity, 1, &state->pad, 0);
+	err =3D media_entity_init(&sd->entity, 1, &state->pad);
 	if (err < 0)
 		goto err_hdl;
=20
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index a93985a9b070..11801636d901 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -1097,7 +1097,7 @@ tvp514x_probe(struct i2c_client *client, const st=
ruct i2c_device_id *id)
 	decoder->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
 	decoder->sd.entity.flags |=3D MEDIA_ENT_T_V4L2_SUBDEV_DECODER;
=20
-	ret =3D media_entity_init(&decoder->sd.entity, 1, &decoder->pad, 0);
+	ret =3D media_entity_init(&decoder->sd.entity, 1, &decoder->pad);
 	if (ret < 0) {
 		v4l2_err(sd, "%s decoder driver failed to register !!\n",
 			 sd->name);
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index f617d8b745ee..3630f3e2a4c7 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -1014,7 +1014,7 @@ static int tvp7002_probe(struct i2c_client *c, co=
nst struct i2c_device_id *id)
 	device->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
 	device->sd.entity.flags |=3D MEDIA_ENT_T_V4L2_SUBDEV_DECODER;
=20
-	error =3D media_entity_init(&device->sd.entity, 1, &device->pad, 0);
+	error =3D media_entity_init(&device->sd.entity, 1, &device->pad);
 	if (error < 0)
 		return error;
 #endif
diff --git a/drivers/media/media-entity.c b/drivers/media/media-entity.=
c
index 4d8e01c7b1b2..78440c7aad94 100644
--- a/drivers/media/media-entity.c
+++ b/drivers/media/media-entity.c
@@ -30,7 +30,6 @@
  * media_entity_init - Initialize a media entity
  *
  * @num_pads: Total number of sink and source pads.
- * @extra_links: Initial estimate of the number of extra links.
  * @pads: Array of 'num_pads' pads.
  *
  * The total number of pads is an intrinsic property of entities known=
 by the
@@ -52,10 +51,10 @@
  */
 int
 media_entity_init(struct media_entity *entity, u16 num_pads,
-		  struct media_pad *pads, u16 extra_links)
+		  struct media_pad *pads)
 {
 	struct media_link *links;
-	unsigned int max_links =3D num_pads + extra_links;
+	unsigned int max_links =3D num_pads;
 	unsigned int i;
=20
 	links =3D kzalloc(max_links * sizeof(links[0]), GFP_KERNEL);
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers=
/media/platform/exynos4-is/fimc-capture.c
index cfebf292e15a..0627a93b2f3b 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1804,7 +1804,7 @@ static int fimc_register_capture_device(struct fi=
mc_dev *fimc,
 	vid_cap->wb_fmt.code =3D fmt->mbus_code;
=20
 	vid_cap->vd_pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&vfd->entity, 1, &vid_cap->vd_pad, 0);
+	ret =3D media_entity_init(&vfd->entity, 1, &vid_cap->vd_pad);
 	if (ret)
 		goto err_free_ctx;
=20
@@ -1897,7 +1897,7 @@ int fimc_initialize_capture_subdev(struct fimc_de=
v *fimc)
 	fimc->vid_cap.sd_pads[FIMC_SD_PAD_SINK_FIFO].flags =3D MEDIA_PAD_FL_S=
INK;
 	fimc->vid_cap.sd_pads[FIMC_SD_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOUR=
CE;
 	ret =3D media_entity_init(&sd->entity, FIMC_SD_PADS_NUM,
-				fimc->vid_cap.sd_pads, 0);
+				fimc->vid_cap.sd_pads);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drive=
rs/media/platform/exynos4-is/fimc-isp-video.c
index 76b6b4d14616..b7dc5ac66e36 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -618,7 +618,7 @@ int fimc_isp_video_device_register(struct fimc_isp =
*isp,
 	vdev->lock =3D &isp->video_lock;
=20
 	iv->pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&vdev->entity, 1, &iv->pad, 0);
+	ret =3D media_entity_init(&vdev->entity, 1, &iv->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/med=
ia/platform/exynos4-is/fimc-isp.c
index 5d78f5716f3b..f52eebf765c1 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -709,7 +709,7 @@ int fimc_isp_subdev_create(struct fimc_isp *isp)
 	isp->subdev_pads[FIMC_ISP_SD_PAD_SRC_FIFO].flags =3D MEDIA_PAD_FL_SOU=
RCE;
 	isp->subdev_pads[FIMC_ISP_SD_PAD_SRC_DMA].flags =3D MEDIA_PAD_FL_SOUR=
CE;
 	ret =3D media_entity_init(&sd->entity, FIMC_ISP_SD_PADS_NUM,
-				isp->subdev_pads, 0);
+				isp->subdev_pads);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/me=
dia/platform/exynos4-is/fimc-lite.c
index ca6261a86a5f..e8f707d1729b 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1322,7 +1322,7 @@ static int fimc_lite_subdev_registered(struct v4l=
2_subdev *sd)
 		return ret;
=20
 	fimc->vd_pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&vfd->entity, 1, &fimc->vd_pad, 0);
+	ret =3D media_entity_init(&vfd->entity, 1, &fimc->vd_pad);
 	if (ret < 0)
 		return ret;
=20
@@ -1437,7 +1437,7 @@ static int fimc_lite_create_capture_subdev(struct=
 fimc_lite *fimc)
 	fimc->subdev_pads[FLITE_SD_PAD_SOURCE_DMA].flags =3D MEDIA_PAD_FL_SOU=
RCE;
 	fimc->subdev_pads[FLITE_SD_PAD_SOURCE_ISP].flags =3D MEDIA_PAD_FL_SOU=
RCE;
 	ret =3D media_entity_init(&sd->entity, FLITE_SD_PADS_NUM,
-				fimc->subdev_pads, 0);
+				fimc->subdev_pads);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/med=
ia/platform/exynos4-is/fimc-m2m.c
index 0ad1b6f84a27..b57daec48b21 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -738,7 +738,7 @@ int fimc_register_m2m_device(struct fimc_dev *fimc,
 		return PTR_ERR(fimc->m2m.m2m_dev);
 	}
=20
-	ret =3D media_entity_init(&vfd->entity, 0, NULL, 0);
+	ret =3D media_entity_init(&vfd->entity, 0, NULL);
 	if (ret)
 		goto err_me;
=20
diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/me=
dia/platform/exynos4-is/mipi-csis.c
index d74e1bec3d86..cf10cd783a86 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -866,7 +866,7 @@ static int s5pcsis_probe(struct platform_device *pd=
ev)
 	state->pads[CSIS_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
 	state->pads[CSIS_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
 	ret =3D media_entity_init(&state->sd.entity,
-				CSIS_PADS_NUM, state->pads, 0);
+				CSIS_PADS_NUM, state->pads);
 	if (ret < 0)
 		goto e_clkdis;
=20
diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/=
platform/omap3isp/ispccdc.c
index a6a61cce43dd..3b10304b580b 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -2650,7 +2650,7 @@ static int ccdc_init_entities(struct isp_ccdc_dev=
ice *ccdc)
 	pads[CCDC_PAD_SOURCE_OF].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &ccdc_media_ops;
-	ret =3D media_entity_init(me, CCDC_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, CCDC_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/omap3isp/ispccp2.c b/drivers/media/=
platform/omap3isp/ispccp2.c
index 38e6a974c5b1..e1b5f5bea541 100644
--- a/drivers/media/platform/omap3isp/ispccp2.c
+++ b/drivers/media/platform/omap3isp/ispccp2.c
@@ -1071,7 +1071,7 @@ static int ccp2_init_entities(struct isp_ccp2_dev=
ice *ccp2)
 	pads[CCP2_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &ccp2_media_ops;
-	ret =3D media_entity_init(me, CCP2_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, CCP2_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/omap3isp/ispcsi2.c b/drivers/media/=
platform/omap3isp/ispcsi2.c
index a78338d012b4..6fff92f0813a 100644
--- a/drivers/media/platform/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/omap3isp/ispcsi2.c
@@ -1245,7 +1245,7 @@ static int csi2_init_entities(struct isp_csi2_dev=
ice *csi2)
 				    | MEDIA_PAD_FL_MUST_CONNECT;
=20
 	me->ops =3D &csi2_media_ops;
-	ret =3D media_entity_init(me, CSI2_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, CSI2_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/med=
ia/platform/omap3isp/isppreview.c
index 13803270d104..b440c6342ca4 100644
--- a/drivers/media/platform/omap3isp/isppreview.c
+++ b/drivers/media/platform/omap3isp/isppreview.c
@@ -2282,7 +2282,7 @@ static int preview_init_entities(struct isp_prev_=
device *prev)
 	pads[PREV_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &preview_media_ops;
-	ret =3D media_entity_init(me, PREV_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, PREV_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/omap3isp/ispresizer.c b/drivers/med=
ia/platform/omap3isp/ispresizer.c
index 7cfb43dc0ffd..3deb1ec4a973 100644
--- a/drivers/media/platform/omap3isp/ispresizer.c
+++ b/drivers/media/platform/omap3isp/ispresizer.c
@@ -1728,7 +1728,7 @@ static int resizer_init_entities(struct isp_res_d=
evice *res)
 	pads[RESZ_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &resizer_media_ops;
-	ret =3D media_entity_init(me, RESZ_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, RESZ_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/=
platform/omap3isp/ispstat.c
index 20434e83e801..92a31dd28ace 100644
--- a/drivers/media/platform/omap3isp/ispstat.c
+++ b/drivers/media/platform/omap3isp/ispstat.c
@@ -1029,7 +1029,7 @@ static int isp_stat_init_entities(struct ispstat =
*stat, const char *name,
 	stat->pad.flags =3D MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	me->ops =3D NULL;
=20
-	return media_entity_init(me, 1, &stat->pad, 0);
+	return media_entity_init(me, 1, &stat->pad);
 }
=20
 int omap3isp_stat_init(struct ispstat *stat, const char *name,
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media=
/platform/omap3isp/ispvideo.c
index d285af18df7f..1809e52d2df9 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1368,7 +1368,7 @@ int omap3isp_video_init(struct isp_video *video, =
const char *name)
 	if (IS_ERR(video->alloc_ctx))
 		return PTR_ERR(video->alloc_ctx);
=20
-	ret =3D media_entity_init(&video->video.entity, 1, &video->pad, 0);
+	ret =3D media_entity_init(&video->video.entity, 1, &video->pad);
 	if (ret < 0) {
 		vb2_dma_contig_cleanup_ctx(video->alloc_ctx);
 		return ret;
diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers=
/media/platform/s3c-camif/camif-capture.c
index 76e6289a5612..eae667eab1b9 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -1159,7 +1159,7 @@ int s3c_camif_register_video_node(struct camif_de=
v *camif, int idx)
 		goto err_vd_rel;
=20
 	vp->pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&vfd->entity, 1, &vp->pad, 0);
+	ret =3D media_entity_init(&vfd->entity, 1, &vp->pad);
 	if (ret)
 		goto err_vd_rel;
=20
@@ -1575,7 +1575,7 @@ int s3c_camif_create_subdev(struct camif_dev *cam=
if)
 	camif->pads[CAMIF_SD_PAD_SOURCE_P].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	ret =3D media_entity_init(&sd->entity, CAMIF_SD_PADS_NUM,
-				camif->pads, 0);
+				camif->pads);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/=
platform/vsp1/vsp1_entity.c
index fd95a75b04f4..619942ff2058 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -220,7 +220,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, stru=
ct vsp1_entity *entity,
=20
 	/* Initialize the media entity. */
 	return media_entity_init(&entity->subdev.entity, num_pads,
-				 entity->pads, 0);
+				 entity->pads);
 }
=20
 void vsp1_entity_destroy(struct vsp1_entity *entity)
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/p=
latform/vsp1/vsp1_video.c
index 3c124c14ce14..17f08973f835 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -1221,7 +1221,7 @@ int vsp1_video_init(struct vsp1_video *video, str=
uct vsp1_entity *rwpf)
 	video->pipe.state =3D VSP1_PIPELINE_STOPPED;
=20
 	/* Initialize the media entity... */
-	ret =3D media_entity_init(&video->video.entity, 1, &video->pad, 0);
+	ret =3D media_entity_init(&video->video.entity, 1, &video->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media=
/platform/xilinx/xilinx-dma.c
index e779c93cb015..f7f9aa353a55 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -676,7 +676,7 @@ int xvip_dma_init(struct xvip_composite_device *xde=
v, struct xvip_dma *dma,
 	dma->pad.flags =3D type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE
 		       ? MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
=20
-	ret =3D media_entity_init(&dma->video.entity, 1, &dma->pad, 0);
+	ret =3D media_entity_init(&dma->video.entity, 1, &dma->pad);
 	if (ret < 0)
 		goto error;
=20
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media=
/platform/xilinx/xilinx-tpg.c
index b5f7d5ecb7f6..285976aa0f4d 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -836,7 +836,7 @@ static int xtpg_probe(struct platform_device *pdev)
 	subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
 	subdev->entity.ops =3D &xtpg_media_ops;
=20
-	ret =3D media_entity_init(&subdev->entity, xtpg->npads, xtpg->pads, 0=
);
+	ret =3D media_entity_init(&subdev->entity, xtpg->npads, xtpg->pads);
 	if (ret < 0)
 		goto error;
=20
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/=
usb/cx231xx/cx231xx-video.c
index c6ff8968286a..8f04b125486f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -2175,7 +2175,7 @@ int cx231xx_register_analog_devices(struct cx231x=
x *dev)
 	cx231xx_vdev_init(dev, &dev->vdev, &cx231xx_video_template, "video");
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	dev->video_pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&dev->vdev.entity, 1, &dev->video_pad, 0);
+	ret =3D media_entity_init(&dev->vdev.entity, 1, &dev->video_pad);
 	if (ret < 0)
 		dev_err(dev->dev, "failed to initialize video media entity!\n");
 #endif
@@ -2202,7 +2202,7 @@ int cx231xx_register_analog_devices(struct cx231x=
x *dev)
=20
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	dev->vbi_pad.flags =3D MEDIA_PAD_FL_SINK;
-	ret =3D media_entity_init(&dev->vbi_dev.entity, 1, &dev->vbi_pad, 0);
+	ret =3D media_entity_init(&dev->vbi_dev.entity, 1, &dev->vbi_pad);
 	if (ret < 0)
 		dev_err(dev->dev, "failed to initialize vbi media entity!\n");
 #endif
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc=
/uvc_entity.c
index dc56a59ecadc..245445491516 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -89,10 +89,10 @@ static int uvc_mc_init_entity(struct uvc_entity *en=
tity)
 			sizeof(entity->subdev.name));
=20
 		ret =3D media_entity_init(&entity->subdev.entity,
-					entity->num_pads, entity->pads, 0);
+					entity->num_pads, entity->pads);
 	} else if (entity->vdev !=3D NULL) {
 		ret =3D media_entity_init(&entity->vdev->entity,
-					entity->num_pads, entity->pads, 0);
+					entity->num_pads, entity->pads);
 		if (entity->flags & UVC_ENTITY_FLAG_DEFAULT)
 			entity->vdev->entity.flags |=3D MEDIA_ENT_FL_DEFAULT;
 	} else
diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-=
core/tuner-core.c
index 581e21ad6801..100b8f069640 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -699,7 +699,7 @@ register_client:
 	t->sd.entity.type =3D MEDIA_ENT_T_V4L2_SUBDEV_TUNER;
 	t->sd.entity.name =3D t->name;
=20
-	ret =3D media_entity_init(&t->sd.entity, 1, &t->pad, 0);
+	ret =3D media_entity_init(&t->sd.entity, 1, &t->pad);
 	if (ret < 0) {
 		tuner_err("failed to initialize media entity!\n");
 		kfree(t);
diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/m=
edia/v4l2-core/v4l2-flash-led-class.c
index 5bdfb8d5263a..34c489fed55e 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -651,7 +651,7 @@ struct v4l2_flash *v4l2_flash_init(
 	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
 	strlcpy(sd->name, config->dev_name, sizeof(sd->name));
=20
-	ret =3D media_entity_init(&sd->entity, 0, NULL, 0);
+	ret =3D media_entity_init(&sd->entity, 0, NULL);
 	if (ret < 0)
 		return ERR_PTR(ret);
=20
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c b/drivers=
/staging/media/davinci_vpfe/dm365_ipipe.c
index 1bbb90ce0086..b89a057b8b7e 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
@@ -1839,7 +1839,7 @@ vpfe_ipipe_init(struct vpfe_ipipe_device *ipipe, =
struct platform_device *pdev)
 	v4l2_ctrl_handler_setup(&ipipe->ctrls);
 	sd->ctrl_handler =3D &ipipe->ctrls;
=20
-	return media_entity_init(me, IPIPE_PADS_NUM, pads, 0);
+	return media_entity_init(me, IPIPE_PADS_NUM, pads);
 }
=20
 /*
diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c b/drive=
rs/staging/media/davinci_vpfe/dm365_ipipeif.c
index 8b230541b1d1..8fb676186898 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
@@ -1026,7 +1026,7 @@ int vpfe_ipipeif_init(struct vpfe_ipipeif_device =
*ipipeif,
 	ipipeif->output =3D IPIPEIF_OUTPUT_NONE;
 	me->ops =3D &ipipeif_media_ops;
=20
-	ret =3D media_entity_init(me, IPIPEIF_NUM_PADS, pads, 0);
+	ret =3D media_entity_init(me, IPIPEIF_NUM_PADS, pads);
 	if (ret)
 		goto fail;
=20
diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/=
staging/media/davinci_vpfe/dm365_isif.c
index 80907b464412..b1f01adfa7c8 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -2052,7 +2052,7 @@ int vpfe_isif_init(struct vpfe_isif_device *isif,=
 struct platform_device *pdev)
 	isif->input =3D ISIF_INPUT_NONE;
 	isif->output =3D ISIF_OUTPUT_NONE;
 	me->ops =3D &isif_media_ops;
-	status =3D media_entity_init(me, ISIF_PADS_NUM, pads, 0);
+	status =3D media_entity_init(me, ISIF_PADS_NUM, pads);
 	if (status)
 		goto isif_fail;
 	isif->video_out.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.c b/drive=
rs/staging/media/davinci_vpfe/dm365_resizer.c
index acb293ed9c91..692789aa22f4 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_resizer.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
@@ -1915,7 +1915,7 @@ int vpfe_resizer_init(struct vpfe_resizer_device =
*vpfe_rsz,
 	vpfe_rsz->crop_resizer.output2 =3D RESIZER_CROP_OUTPUT_NONE;
 	vpfe_rsz->crop_resizer.rsz_device =3D vpfe_rsz;
 	me->ops =3D &resizer_media_ops;
-	ret =3D media_entity_init(me, RESIZER_CROP_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, RESIZER_CROP_PADS_NUM, pads);
 	if (ret)
 		return ret;
=20
@@ -1937,7 +1937,7 @@ int vpfe_resizer_init(struct vpfe_resizer_device =
*vpfe_rsz,
 	vpfe_rsz->resizer_a.output =3D RESIZER_OUTPUT_NONE;
 	vpfe_rsz->resizer_a.rsz_device =3D vpfe_rsz;
 	me->ops =3D &resizer_media_ops;
-	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads);
 	if (ret)
 		return ret;
=20
@@ -1959,7 +1959,7 @@ int vpfe_resizer_init(struct vpfe_resizer_device =
*vpfe_rsz,
 	vpfe_rsz->resizer_b.output =3D RESIZER_OUTPUT_NONE;
 	vpfe_rsz->resizer_b.rsz_device =3D vpfe_rsz;
 	me->ops =3D &resizer_media_ops;
-	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/=
staging/media/davinci_vpfe/vpfe_video.c
index 87048a14c34d..61a8d5beff58 100644
--- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
+++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
@@ -1594,7 +1594,7 @@ int vpfe_video_init(struct vpfe_video_device *vid=
eo, const char *name)
 	spin_lock_init(&video->dma_queue_lock);
 	mutex_init(&video->lock);
 	ret =3D media_entity_init(&video->video_dev.entity,
-				1, &video->pad, 0);
+				1, &video->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/stagin=
g/media/omap4iss/iss_csi2.c
index bc83f8246101..e936cfc218cb 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -1271,7 +1271,7 @@ static int csi2_init_entities(struct iss_csi2_dev=
ice *csi2, const char *subname)
 	pads[CSI2_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
=20
 	me->ops =3D &csi2_media_ops;
-	ret =3D media_entity_init(me, CSI2_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, CSI2_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/stagi=
ng/media/omap4iss/iss_ipipe.c
index f94a59299a83..e1a7b7ba7362 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -513,7 +513,7 @@ static int ipipe_init_entities(struct iss_ipipe_dev=
ice *ipipe)
 	pads[IPIPE_PAD_SOURCE_VP].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &ipipe_media_ops;
-	ret =3D media_entity_init(me, IPIPE_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, IPIPE_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/sta=
ging/media/omap4iss/iss_ipipeif.c
index c0da13d55865..be5f80d7b5dc 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -743,7 +743,7 @@ static int ipipeif_init_entities(struct iss_ipipeif=
_device *ipipeif)
 	pads[IPIPEIF_PAD_SOURCE_VP].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &ipipeif_media_ops;
-	ret =3D media_entity_init(me, IPIPEIF_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, IPIPEIF_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/sta=
ging/media/omap4iss/iss_resizer.c
index 5030cf3cd34c..91e724085dba 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -787,7 +787,7 @@ static int resizer_init_entities(struct iss_resizer=
_device *resizer)
 	pads[RESIZER_PAD_SOURCE_MEM].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	me->ops =3D &resizer_media_ops;
-	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads, 0);
+	ret =3D media_entity_init(me, RESIZER_PADS_NUM, pads);
 	if (ret < 0)
 		return ret;
=20
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/stagi=
ng/media/omap4iss/iss_video.c
index 40405d8710a6..bae67742706f 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -1104,7 +1104,7 @@ int omap4iss_video_init(struct iss_video *video, =
const char *name)
 		return -EINVAL;
 	}
=20
-	ret =3D media_entity_init(&video->video.entity, 1, &video->pad, 0);
+	ret =3D media_entity_init(&video->video.entity, 1, &video->pad);
 	if (ret < 0)
 		return ret;
=20
diff --git a/include/media/media-entity.h b/include/media/media-entity.=
h
index 0c003d817493..8b21a4d920d9 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -127,7 +127,7 @@ struct media_entity_graph {
 };
=20
 int media_entity_init(struct media_entity *entity, u16 num_pads,
-		struct media_pad *pads, u16 extra_links);
+		struct media_pad *pads);
 void media_entity_cleanup(struct media_entity *entity);
=20
 int media_entity_create_link(struct media_entity *source, u16 source_p=
ad,
--=20
2.4.3
