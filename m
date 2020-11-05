Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB97EC4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 07:48:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C4FD20936
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 07:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZQ/2yeX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEHsq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 02:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEHsq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 02:48:46 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284FCC0613CF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 23:48:46 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id t11so482435edj.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2020 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jp0SdzNOla7zuZRmcx4XhZhdx8/hP/A000/o30dOREY=;
        b=gZQ/2yeXNJqQn0ouyw+B68LLnr7iDmO8n6aGys0v1vSwoAiFVHPqjE56a/njhE0T0L
         LqU6RyS07kik08+RofknTVq6iCJSW3f2D7Diu/XdwCAAHHXlJv16PwQ/s6cJYztAmmKE
         Cf6h2srhMdDr9BpKH04YHLOlTd/zSveLJIC83uOkGGpAj6zmWlWEAqiVij8Oeyj+OsIM
         yan/GZLmWcOh/apcbjOGXI+BG7L+GKupdtvnrUzgcKzZJRy3+Dpfzjochu5hwpMxssbc
         KC6QYvgldKvRmkC0lrf5X96fULMPmfcKoZaTqMdIFfLaTHmGB3fl1z/Xin8JJqXZmrKE
         wrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jp0SdzNOla7zuZRmcx4XhZhdx8/hP/A000/o30dOREY=;
        b=gbxqGz/gCWMx1o/biVbKfYcnVlhvRXZ2z5ks2jTpYRpkig6zONfZ9phZ/mfPGcMzjZ
         6ZFknAK3flm8B2rKyNizdSL7q+B65X396+f9OD2Gcb5lADPK9EObyh+WyOvmkColyAyc
         +pBiEFJrVtd2R+iB173qDyR3LG3dW3t5LsGsqM9ddxvhhO5Iqkwnq16ue2vpScDCGq6l
         Los/LMRwghdNKDQlCJxEiDfdeU0FQbVr8Qn7tz0xW4E9f8ns2X2IhbQPzN/90GU/mUq6
         b4jUnX7wKD5BP4Sjb9/a8vzmcPDBRs1oWTvKsvt8xd4Xfom5WcV7LKCsPHExpl05byQ6
         AodA==
X-Gm-Message-State: AOAM531AmBbgeh+rZd9gHznwvj53Z/8o5IqKEGOowUJlzbc7ck6IMs2l
        JiHhGaV8Uy3H402WCkdBX2JO6o7k/KDbpU0k97s=
X-Google-Smtp-Source: ABdhPJyhznue3Bid+Y+EWVF18XzPlo64Korc8QyD5o0ggvNO5GqDUOprUbHQEcChVZ57npIELbQ9CuRvVXFkGPpd9ZI=
X-Received: by 2002:aa7:d1c6:: with SMTP id g6mr1279259edp.130.1604562524943;
 Wed, 04 Nov 2020 23:48:44 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7@eucas1p1.samsung.com>
 <20201103140214.21690-1-m.szyprowski@samsung.com> <478212e8-91c3-4a18-2e8f-b9222052f3de@samsung.com>
In-Reply-To: <478212e8-91c3-4a18-2e8f-b9222052f3de@samsung.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 5 Nov 2020 13:18:35 +0530
Message-ID: <CANAwSgQKGs5GP3HOvSuegkbnmVUeN3t98QVVtNcm3yE7L77LOQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Enable DWC2 dual-role support on
 OdroidU3+ boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Wed, 4 Nov 2020 at 02:56, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 03.11.2020 15:02, Marek Szyprowski wrote:
> > MicroUSB port on OdroidU3+ boards can operate both as peripheral or as
> > host port. Till now it was configured as pheriperal only port, but it
> > turned out that the DWC2 driver code already handles everything needed to
> > support USB role-switch, so switch it to dual-role (OTG) mode. This has
> > no effect on OdroidU3 (with 'plus') and OdroidX2, which doesn't have USB
> /s/with/without
> > needed ID pin and VBUS wiring. Those will still operate correctly in
> > pheriperal mode only.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---

Thanks I have tested this patch on Odroid U3+
it enable the otg port

[alarm@archl-u3et ~]$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=exynos-ehci/3p, 480M
    |__ Port 2: Dev 2, If 0, Class=Vendor Specific Class, Driver=smsc95xx, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 480M

Please add my
Tested-by: Anand Moon <linux.amoon@gmail.com>

Best Regards
Anand
