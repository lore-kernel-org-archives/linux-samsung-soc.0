From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/7] ASoC: Add
 snd_soc_of_put_dai_link_codecs() helper function
Date: Fri, 09 Mar 2018 18:48:54 +0100
Message-ID: <20180309174858.24017-3-s.nawrocki@samsung.com>
References: <20180309174858.24017-1-s.nawrocki@samsung.com>
 <CGME20180309175002epcas2p3236ef0496e8848f4a802440b22d6f54c@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180309174858.24017-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, javierm@redhat.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The code for dereferencing device nodes in the 'codecs' array is moved
to a separate function so we can avoid open coding that in drivers.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none.
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 747fd583b9dc..4a387f0b3d56 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1807,6 +1807,7 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
 int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link);
+void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link);

 int snd_soc_add_dai_link(struct snd_soc_card *card,
 				struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 96c44f6576c9..a1f86e85bff9 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -4397,6 +4397,26 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_name);

+/*
+ * snd_soc_of_put_dai_link_codecs - Dereference device nodes in the codecs array
+ * @dai_link: DAI link
+ *
+ * Dereference device nodes acquired by snd_soc_of_get_dai_link_codecs().
+ */
+void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_component *component = dai_link->codecs;
+	int index;
+
+	for (index = 0; index < dai_link->num_codecs; index++, component++) {
+		if (!component->of_node)
+			break;
+		of_node_put(component->of_node);
+		component->of_node = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
+
 /*
  * snd_soc_of_get_dai_link_codecs - Parse a list of CODECs in the devicetree
  * @dev: Card device
@@ -4406,7 +4426,8 @@ EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_name);
  * Builds an array of CODEC DAI components from the DAI link property
  * 'sound-dai'.
  * The array is set in the DAI link and the number of DAIs is set accordingly.
- * The device nodes in the array (of_node) must be dereferenced by the caller.
+ * The device nodes in the array (of_node) must be dereferenced by calling
+ * snd_soc_of_put_dai_link_codecs() on @dai_link.
  *
  * Returns 0 for success
  */
@@ -4454,14 +4475,7 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 	}
 	return 0;
 err:
-	for (index = 0, component = dai_link->codecs;
-	     index < dai_link->num_codecs;
-	     index++, component++) {
-		if (!component->of_node)
-			break;
-		of_node_put(component->of_node);
-		component->of_node = NULL;
-	}
+	snd_soc_of_put_dai_link_codecs(dai_link);
 	dai_link->codecs = NULL;
 	dai_link->num_codecs = 0;
 	return ret;
--
2.14.2
