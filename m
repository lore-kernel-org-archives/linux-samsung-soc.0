Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F970C19F2D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 11:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbiHILLj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiHILLh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 07:11:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6062921259
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 04:11:34 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y23so12594749ljh.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bqgHVallIu51Zit978W8ZsqsiCpb+ZOtg8drEclaxvo=;
        b=rGL8slx2g/BAdy9dHk3nuWUfNK7f9+Wo1FtQ0TMvD8TxiF7PRFqwqkWDLqos2E7HwE
         R7Ax6RJcf4TQUpw5GNxRNGHgTqeUTZ/oZelEDJ0M8WxjEP43xSvRrzQqInusXi7k+SWd
         kiCgfQ15PhDScTW+dA27xj+z6+8PhqAK/Z5opcSPswLXAUuVaBng8qo+pP39CnWN5+7f
         q/T5ZL63aSNjJlrfDrfQIrxVia0PPCHf0p9yTKzikPrHM0p0NyVLKfZYccTlQE5R3zQd
         xHLq3qAezcQ4m9/wCmViXgO0l5k5HIthS4H3WqRMQmkL7/ECn/GS1fm9bgvdQTqqT++c
         chXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bqgHVallIu51Zit978W8ZsqsiCpb+ZOtg8drEclaxvo=;
        b=M15bmVHJSD328F3fZTidDdfgP4hezgJFUO5jAj0/xvLMaq9Fqj5i9ihY6rVfTmcRUl
         AhC5yi/HbKrTkX6Kx2OabKSEz3UJdvlTHVEaneR94YibmtlWjxu4+WGqwpdhmghWjMDM
         UYeRLvO57xYxWkVzwa6lmxBn9has0LXMIhKc/u+rROI5AmH5V9mgYdPBFtK9qTsuvcYe
         AKIk7T5zSi81+CqQO9dISocqmlrFTYoepqXR9GHNlxZktV2XcxjOtcB+UX+toEkNQr5y
         hmaiE/imzdFOFtorui4pmAPTQyISjRcfb2twG8/utTlXiLx2StUeI40Y0bArtqZJDTb5
         A0TQ==
X-Gm-Message-State: ACgBeo0/bTX1NnYIKkFqLNX4NfNdIwOMmQB1QaPAULEdO5c+6sVeyUjM
        uFiTQZFJNh+zP0zlb5l2p4EQ2Rbz4ZMsjZZvSiYr3Q==
X-Google-Smtp-Source: AA6agR5tKRU6VTJzELReZukb+vQJnv8Nmk4+4ogoC2Dit759e8QEhA7prTXlE+cQrHxXkExOaq7ev0zeUZFXYHN61Ys=
X-Received: by 2002:a2e:aaa2:0:b0:25e:5083:eb9a with SMTP id
 bj34-20020a2eaaa2000000b0025e5083eb9amr7043698ljb.283.1660043492737; Tue, 09
 Aug 2022 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220808201724.27831-1-semen.protsenko@linaro.org> <7f87a846-9e00-7fec-45dc-4a1b5004971c@linaro.org>
In-Reply-To: <7f87a846-9e00-7fec-45dc-4a1b5004971c@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 9 Aug 2022 14:11:21 +0300
Message-ID: <CAPLW+4mtDOGL_mPv3hvVXMpRESK2GzZjS8MynKyhL7aQGHg1EA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: exynos850: Add cmu and sysmmu nodes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 9 Aug 2022 at 10:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/08/2022 23:17, Sam Protsenko wrote:
> > Now that all clock domains needed for SysMMUs are implemented [1]
> > (pending), and the basic SysMMU v7 support is ready as well [2], let's
> > add all related CMU and SysMMU nodes to Exynos850 SoC device tree.
> >
> > All those SysMMU instances were tested with "emulated translation"
> > driver [4] on E850-96 board: both the emulated translation and fault
> > handling were verified.
> >
> > This patch series depends on [1], so it must be taken into the account
> > when merging it.
> >
> > [1] https://lkml.org/lkml/2022/8/8/752
>
> It should not be sent separately then, unless you are fine waiting
> entire cycle for this to land.
>

Sure, good point. If it's possible to take all those patches in a
single tree. I remember we already had a similar issue previously.

> Best regards,
> Krzysztof
