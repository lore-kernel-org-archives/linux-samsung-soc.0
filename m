From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] [PATCH v3] rtc: s5m: Add the support for S2MPS13 RTC
Date: Tue, 24 Feb 2015 09:21:27 +0100
Message-ID: <CAJKOXPdb9=B-s=EEdB8-pDoDNw8KyZwuD68_NgcAdVpBc-v0hg@mail.gmail.com>
References: <1424758197-20057-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424758197-20057-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, akpm@linux-foundation.org, inki.dae@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2015-02-24 7:09 GMT+01:00 Chanwoo Choi <cw00.choi@samsung.com>:
> This patch adds only the compatible string for S2MPS13 clock which is identical
> with S2MPS14 clock driver.

If everything is identical then maybe use the same ID?
        { "s5m-rtc",            S5M8767X },
+       { "s2mps13-rtc",        S2MPS14X },
        { "s2mps14-rtc",        S2MPS14X },

Or in mfd/sec-core:
 static const struct mfd_cell s2mps13_devs[] = {
-        { .name = "s2mps13-rtc", },
+       { .name = "s2mps14-rtc", },

The duplication of all S2MPS14 labels seems not necessary in such case.

Best regards,
Krzysztof
