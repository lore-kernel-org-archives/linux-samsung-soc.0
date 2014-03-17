From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/9] exynos/fimd: add parallel output related bindings
Date: Mon, 17 Mar 2014 11:27:20 +0100
Message-ID: <1395052045-23848-5-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Denis Carikli <denis@eukrea.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds bindings required to add support
for parallel output.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 Documentation/devicetree/bindings/video/samsung-fimd.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
index 36b7895..2dad41b 100644
--- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -41,6 +41,21 @@ Optional Properties:
 - samsung,power-domain: a phandle to FIMD power domain node.
 - samsung,invert-vden: video enable signal is inverted
 - samsung,invert-vclk: video clock signal is inverted
+- display-timings: timing settings for FIMD, as described in document [1].
+		Can be used in case timings cannot be provided otherwise
+		or to override timings provided by the panel.
+
+The device node can contain 'port' child nodes according to the bindings defined
+in [2]. The following are properties specific to those nodes:
+- reg: (required) port index, can be:
+		0 - for CAMIF0 input,
+		1 - for CAMIF1 input,
+		2 - for CAMIF2 input,
+		3 - for parallel output,
+		4 - for write-back interface
+
+[1]: Documentation/devicetree/bindings/video/display-timing.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Example:
 
-- 
1.8.3.2
