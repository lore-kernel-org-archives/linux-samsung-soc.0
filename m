From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4 7/9] tests/exynos: replace return by break
Date: Wed, 13 May 2015 19:34:51 +0200
Message-ID: <1431538493-11431-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55350 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933578AbbEMRhk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 13:37:40 -0400
In-Reply-To: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The 'usage' function already does exit(0), so that this
'return -EINVAL' is never called. Just put a break there
to avoid confusion.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index e64bb32..64dacfa 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -689,7 +689,7 @@ int main(int argc, char **argv)
 			break;
 		default:
 			usage(argv[0]);
-			return -EINVAL;
+			break;
 		}
 	}
 
-- 
2.0.5
