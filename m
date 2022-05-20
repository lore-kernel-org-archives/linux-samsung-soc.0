Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6B5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 11:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241462AbiETLQN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 07:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348442AbiETLP7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 07:15:59 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2ECB11C2F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 04:15:57 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520111552epoutp01258729b0e9af5c02f2620672d9ee8448~wy-1RMqh63038930389epoutp01j
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 11:15:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520111552epoutp01258729b0e9af5c02f2620672d9ee8448~wy-1RMqh63038930389epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653045352;
        bh=MbeoaHZGV9CVwGzNLBVOMT/bPCHrNf1iASg45DjTmJY=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=q4ZgFK0u8iEQF3rr/mNsR8gQbE5voiO17FEuz+l7QHKLlfBcVQADgGyzqqw/jNWwA
         plHrZHQG3DAuj96d7Xs1YlUViSAv8b/Up0JYGxKi6VuBQENfOB9H5hfhhy/ZuOJCQo
         5nXaGZzxIGj0uUJPyEIpQrRgVnKhKWeUL2AVO43E=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220520111551epcas2p2aca39289ccfa7c57ef2ba235b34e4b91~wy-0f_vds0977809778epcas2p2k;
        Fri, 20 May 2022 11:15:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4L4PKb6BRsz4x9Pv; Fri, 20 May
        2022 11:15:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        6F.E1.09694.36877826; Fri, 20 May 2022 20:15:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220520111546epcas2p27c26450593cfa1e1a81feda17a608d84~wy-wKP_3Y0977809778epcas2p2f;
        Fri, 20 May 2022 11:15:46 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520111546epsmtrp268dd2522eec6e34ac2f09b7fc9690d30~wy-wJfoxb0556005560epsmtrp2g;
        Fri, 20 May 2022 11:15:46 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-a4-628778630585
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.57.08924.26877826; Fri, 20 May 2022 20:15:46 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220520111546epsmtip22770db12b6988b6efaf91e60b7388a59~wy-v_W2PE2119721197epsmtip2B;
        Fri, 20 May 2022 11:15:46 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <13662a9c-19c6-cb3d-6073-c87835a3c95d@linaro.org>
Subject: RE: [PATCH] arm64: dts: exynoautov9: add syscon reboot/reboot_mode
 support
Date:   Fri, 20 May 2022 20:15:46 +0900
Message-ID: <000001d86c3a$f40179b0$dc046d10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKfh8+LtggeRy9cOhE7Y4PFrR7r6QFietrKArVFK9qreKWsUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmhW5yRXuSwaJ5uhYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8WM8/uYLFr3HmG3eN63j8mBw2PTqk42jzvX9rB59G1ZxejxeZNc
        AEtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0BlK
        CmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DC
        hOyMywc3shc846qYc6+TqYHxOEcXIyeHhICJxMul9xm7GLk4hAR2MEpM3/QPyvnEKHF+32VW
        kCohgc+MEu/m1cF0nJ93hAWiaBejxNH3a5khnBeMEg2Nv9lAqtgE9CVedmxjBUmICCxmlDje
        tY0NxGEWOMcoMeHbeiaQKk4BO4ljX5+B2cICoRIbDkwD62YRUJXom9cNZvMKWEq8/PuYCcIW
        lDg58wkLiM0sIC+x/e0cZoibFCR+Pl0GdquIgJNE04XvjBA1IhKzO9vAzpMQmMohcW7WNagG
        F4nb7yaxQdjCEq+Ob2GHsKUkPr/bCxUvllg66xMTRHMDo8Tlbb+gEsYSs561A23gANqgKbF+
        lz6IKSGgLHHkFtRtfBIdh/+yQ4R5JTrahCAa1SUObJ/OAmHLSnTP+cw6gVFpFpLPZiH5bBaS
        D2Yh7FrAyLKKUSy1oDg3PbXYqMAEHt3J+bmbGMFpVMtjB+Pstx/0DjEycTAeYpTgYFYS4WXM
        bUkS4k1JrKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnARJ5XEm9oYmlgYmZmaG5kamCuJM7rlbIh
        UUggPbEkNTs1tSC1CKaPiYNTqoFpd+mH3X5ONtkLOvaeVbXVMJLrCXz78XPnsTeawQmZS784
        2otbNef6q16+Nuvqryv+Jw5G3Pat+V+7Q/b61BRXk9jTR2bemO3KrX16886P5vvP3Lj06KV6
        UfWuRc66W1vF2HdKvt8n3DN/T3v1jia/lofd2movKx581bnt+OW74vxUu3tL7Q2XlZ077cFz
        8bHhDZbKE1VN95v32f6sWnxLn3UG+8qFSbHMhqoB+YmFaQcTnn0wSvdtPrflzdTuScHsr9uP
        /+/17pPcs74vfKeVs8/trmXLo5PP6ehF9LzjPPZr86L5cydv+P0hPeP9zqiLN1d/2H/vxVfu
        bAW7fe+6vi3t1EyKDMpRvnewOPxrrhJLcUaioRZzUXEiAFTa65wsBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJXjepoj3J4NxmeYsH87axWVz/8pzV
        Yv6Rc6wWfS8eMlvsfb2V3WLG+X1MFq17j7BbPO/bx+TA4bFpVSebx51re9g8+rasYvT4vEku
        gCWKyyYlNSezLLVI3y6BK+PywY3sBc+4Kubc62RqYDzO0cXIySEhYCJxft4Rli5GLg4hgR2M
        Erd2/GWHSMhKPHu3A8oWlrjfcoQVougZo8SHlo2MIAk2AX2Jlx3bwBIiAosZJfZPusQKkmAW
        uMQocfKaJ0THIUaJ1bv+gCU4Bewkjn19xgRiCwsESzz+1ssMYrMIqEr0zetmA7F5BSwlXv59
        zARhC0qcnPmEBWKotsTTm0+hbHmJ7W/nMEOcpyDx8+kysPkiAk4STRe+M0LUiEjM7mxjnsAo
        PAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCY0pLawfj
        nlUf9A4xMnEwAj3JwawkwsuY25IkxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU
        7NTUgtQimCwTB6dUA1Pdwgy/MHnOXNaTjHp/IjZ07uf63a06o+/lhlUN/W9cF80znXeC12Qa
        y9Py+DvPd2QoqAm6r0uN4k1o49gV8uFu/iR24V8X1HILVFc+VnH98axmvpGEdELa4VtON29o
        s14uvxEzd8uOJys6lxx4eHPfV8vvX8redF1kKT8w/a7zjmlX6rkYGe2ObIjbylg8QUWdk6Fl
        sePRW2bzj+s1RBTNvpKi/jogL3xjpl7fD/VO2a1TD57q3sXxueivhk7/CqYSmSzd/J36Hj/j
        Vz8+2tIasEq5+M7uWS17Y67/2+26bbOh9PG/O3wP/1jkXxblJc4oOqFUb4LSf7MvXyO3lRQa
        smy8yxgfIiA0ofjJ9RQlluKMREMt5qLiRABkosy2GAMAAA==
X-CMS-MailID: 20220520111546epcas2p27c26450593cfa1e1a81feda17a608d84
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866
References: <CGME20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866@epcas2p1.samsung.com>
        <20220520045210.55132-1-chanho61.park@samsung.com>
        <13662a9c-19c6-cb3d-6073-c87835a3c95d@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > index 0ce46ec5cdc3..d99e53406ee0 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > @@ -312,6 +312,22 @@ pinctrl_peric1: pinctrl@10830000 {
> >  		pmu_system_controller: system-controller@10460000 {
> >  			compatible = "samsung,exynos7-pmu", "syscon";
> >  			reg = <0x10460000 0x10000>;
> > +
> > +			reboot: syscon-reboot {
> > +				compatible = "syscon-reboot";
> > +				regmap = <&pmu_system_controller>;
> > +				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
> > +				value = <0x2>;
> > +				mask = <0x2>;
> > +			};
> > +
> > +			reboot_mode: syscon-reboot-mode {
> 
> Node name: just "reboot-mode"

Okay. I'll just put "reboot-mode {" without the label.

> 
> > +				compatible = "syscon-reboot-mode";
> > +				offset = <0x810>; /* SYSIP_DAT0 */
> > +				mode-bootloader = <0xfc>;
> > +				mode-fastboot = <0xfa>;
> > +				mode-recovery = <0xff>;
> 
> These are magic values understood by firmware, so please add a header for
> them (something like include/dt-bindings/soc/rockchip,boot-mode.h
> but with some prefixes like EXYNOSAUTOV9_BOOT_FASTBOOT))

Okay. I'll add samsung,boot-mode.h and put them with the prefix.

Best Regards,
Chanho Park

