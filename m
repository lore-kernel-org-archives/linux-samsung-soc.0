Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A41BC83F17
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Aug 2023 00:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238911AbjH3ApJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Aug 2023 20:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241461AbjH3Aot (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 20:44:49 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92150CD6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 17:44:46 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26b41112708so3251571a91.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693356286; x=1693961086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAx3hUaf67x8Bu35HoDBYJ84Q7sU3VyyMWOcJhmdXls=;
        b=MVmzGGCHceCVXKEKF/KelU/z0eELehCzttHKv5oO7Du1rSLIH0ln/2CSMje8pUe5xF
         PP2HDWxxmnowDM4gOEfksWxYgJxtilW4zyVGmIFD7dwAgQW6agg0hFKRVAlktrVSgxEr
         lnXSLwReHPs+lWOA2/35xQ4M9tSm7ytgpIW63n7GtNWOrIUvmOemWU2tDfExV0+qlYbR
         07BDlwweOdCKrock2e9ko7j82Qj2BLLOWNzFnVYLnm7O4PTfWkUO/4XPo9m32EbhflyV
         XTiG0NjchtBt4YnplGsuIXCbTGmvn3AVg41CBPx0STnSzN87+MV1rAUQGzlRbHnrXvVX
         i9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693356286; x=1693961086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAx3hUaf67x8Bu35HoDBYJ84Q7sU3VyyMWOcJhmdXls=;
        b=gO17NsEGsu76UZriZtBqYLBGOcIWh2QXeN8v7AaBEFJbn22co06st+NPG7dZ8uq7Tt
         ZN6rOiQMM+Q0cpu+xTifD8lcKO98kJQKVl4Dg7ylRrVnWTZseNk+eYlhd/CGzf/ipMfc
         JMsQafCI3IJEu2/+dil3eV+VQ+idyoBXy9NkrblvqRq+7hI6FTVXvtQUGEbED+LNkWOn
         eH/hH9lZHKXdRBNFxuJa7fnh9EhRpLf4Q9jdFwGpSO5M4MebXEtOsoYfyFrsoFA6LAt6
         sVQXzIbNMAJL0y/6v1YlEnwkQ7PKdQNTnMjpUTSEARdZd0OeEHQvAhbGGGy4Qjl+Cyg0
         KbJQ==
X-Gm-Message-State: AOJu0Yx4WcMhORIe5oAkO/00a5gFCYBRAUMJDCVyq/12tr9xF18y7gPH
        +oPo5LbFz2WYQVMvQrUskTsHIYwh2sbq522PnWK/AQ==
X-Google-Smtp-Source: AGHT+IGK3L9I8mGxNoIS6qRuELIHILt6Wgic76VJlZ4wkMageK4SmY3xsxrz7+5yM5g6fOr1CjbqGtBAkeFZp3jZzIk=
X-Received: by 2002:a17:90a:4587:b0:269:1e3f:a54d with SMTP id
 v7-20020a17090a458700b002691e3fa54dmr777844pjg.10.1693356286018; Tue, 29 Aug
 2023 17:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230825215445.28309-1-semen.protsenko@linaro.org> <6fd3a9ab-667d-934b-f1c2-03776be93d4d@linaro.org>
In-Reply-To: <6fd3a9ab-667d-934b-f1c2-03776be93d4d@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 29 Aug 2023 19:44:34 -0500
Message-ID: <CAPLW+4njcwODXoA3Gj=48E-DPOqofcPnJkYMv6yzF5JjyOshDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Enable USB for E850-96 board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 1:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2023 23:54, Sam Protsenko wrote:
> > This patch series enables USB gadget, USB host and Ethernet support for
> > E850-96 board. The most major change was done in USB PHY driver, as the
> > register layout of PHY block in Exynos850 is very different from
> > Exynos5 one.
> >
> > Changes in v2:
>
> Thank you for the patch. Looks good.
> It is too late in the cycle for me to pick it up. I will take it after
> the merge window.
>

Thanks, Krzysztof! So we can expect these to get into v6.6, correct?
Also, I'm trying to keep track of all my patches, so please let me
know if you are going to apply this series to your trees soon, and
which exactly (I presume krzk/linux-dt.git/for-next?).

> Best regards,
> Krzysztof
>
