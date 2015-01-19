From: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: samsung: Document Trats2 audio
 subsystem bindings
Date: Mon, 19 Jan 2015 18:48:21 +0900
Message-ID: <1421660902-29679-3-git-send-email-ideal.song@samsung.com>
References: <1421660902-29679-1-git-send-email-ideal.song@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1421660902-29679-1-git-send-email-ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch add Trats2 audio subsystem bindings document.

Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/sound/samsung,trats2-wm1811.txt       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
new file mode 100644
index 0000000..319ff07
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
@@ -0,0 +1,25 @@
+Samsung Exynos Trats2 audio with WM1811 codec
+
+Required properties:
+
+ - compatible : Must be "samsung,trats2-audio"
+ - samsung,i2s-controller : The phandle of the I2S controller
+ - samsung,model : The user visible name of this sound
+ - samsung,audio-codec : The phandle of the WM1811 audio codec
+ - samsung,audio-routing : A list of the connections between audio
+   components. each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source
+
+Example:
+
+sound {
+	compatible = "samsung,trats2-audio";
+	samsung,i2s-controller = <&i2s0>;
+	samsung,model = "Trats2";
+	samsung,audio-codec = <&wm1811>;
+	samsung,audio-routing =
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP";
+};
-- 
2.0.0.390.gcb682f8

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
