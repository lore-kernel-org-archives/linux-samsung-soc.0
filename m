From: Denis Efremov <efremov@linux.com>
Subject: Re: Bad file pattern in MAINTAINERS section 'SAMSUNG EXYNOS TRUE
 RANDOM NUMBER GENERATOR (TRNG) DRIVER'
Date: Tue, 13 Aug 2019 10:09:26 +0300
Message-ID: <f4e91a72-2d0d-b02e-706e-e53f6f9a2368@linux.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190325212751.27532-1-joe@perches.com>
 <CAJKOXPcyOVLboJHZyEcUx_9HNh+iVq=7OFQN4=qnfL+O4Ld_4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcyOVLboJHZyEcUx_9HNh+iVq=7OFQN4=qnfL+O4Ld_4g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, efremov@linux.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

Initially, I've prepared a patch and only after found this discussion. So, please,
look at this patch no more than just a simple reminder that get_maintainers.pl
still emits this warning.

Best regards,
Denis

------------------------ >8 ------------------------
Subject: [PATCH] MAINTAINERS: exynos trng: Remove samsung,exynos5250-trng.txt record

Update MAINTAINERS to reflect that samsung,exynos5250-trng.txt
file never existed.

Cc: Łukasz Stelmach <l.stelmach@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ea3f82e256b..7d213e192626 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14033,7 +14033,6 @@ M:	Łukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/char/hw_random/exynos-trng.c
-F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
 
 SAMSUNG FRAMEBUFFER DRIVER
 M:	Jingoo Han <jingoohan1@gmail.com>
-- 
2.21.0
