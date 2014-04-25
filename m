From: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RESEND PATCH 0/3] ARM: dts: add device data for exynos4412-trats2
Date: Fri, 25 Apr 2014 11:04:41 +0900
Message-ID: <5359C2B9.5040003@samsung.com>
References: <53327CE3.8030800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <53327CE3.8030800-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Myungjoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset add some device node for exynos4412-trats2.
It is based on v3.15-next/dt-samsung-2 branch.

exynos4412-trats2.dts
- Fix incorrect compatible. Compatible of AK8975 are "ak8975" or "asahi-kasei,ak8975".
- Add cm36651 light/proximity sensor device node.
- Change gpio-key device node. fix incorrect gpio property, and then add "ok-key" node.

Beomho Seo (3):
  ARM: dts: fix incorrect compatible for exynos4412
  ARM: dts: add cm36651 light/proximity sensor node
  ARM: dts: fixed gpio key node for exynos4412

 arch/arm/boot/dts/exynos4412-trats2.dts |   50 ++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
