From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/6] ASoC: Add snd_soc_of_put_dai_link_codecs()
 helper function
Date: Wed, 07 Mar 2018 18:00:37 +0100
Message-ID: <20180307170037.13846-1-s.nawrocki@samsung.com>
References: <CGME20180307170053epcas1p4e9ed540f3f3ab235d760ec73ad3ea141@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The code for dereferencing device nodes in the 'codecs' array is moved
to a separate function so we can avoid repeating the code in drivers.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6a11b0239f74..ad266d7e9553 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1814,6 +1814,7 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
 int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link);
+void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link);

 int snd_soc_add_dai_link(struct snd_soc_card *card,
 				struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 39876737c336..e815be0d5863 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -4358,6 +4358,26 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
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
@@ -4367,7 +4387,8 @@ EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_name);
  * Builds an array of CODEC DAI components from the DAI link property
  * 'sound-dai'.
  * The array is set in the DAI link and the number of DAIs is set accordingly.
- * The device nodes in the array (of_node) must be dereferenced by the caller.
+ * The device nodes in the array (of_node) must be dereferenced by calling
+ * snd_soc_of_put_dai_link_codecs() on @dai_link.
  *
  * Returns 0 for success
  */
@@ -4415,14 +4436,7 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
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
