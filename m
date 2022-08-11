Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7235EC19F2A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Aug 2022 11:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbiHKLxh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Aug 2022 07:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbiHKLxQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 07:53:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3BC6E2D3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Aug 2022 04:53:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a9so25184873lfm.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Aug 2022 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=5HiYzFHc/9Xp6EzsvXqUwFD4ssSumNPG0+vT3T1mUK0=;
        b=eDCPKHKlMIy/f4StHh/b1bfEoZExC+kNQgf1fkCBF1qyOR9H1Ay5YCMC+cVsuh3Ght
         7DwYOLrllPXCy0IOKoA0Hx2PkH60cTX4/lZhWvGtdYpKDiKUtj7iH6fTITy0GpOfXkRt
         6gH0sIXYVXySMUtSPGLVP8OEiu7T/lIj8aNVDWyZsw+ofnklpDrmfg91S70EM4aQt3W1
         ZJY6c8wC+QbVt4Wv/iWIDZyxEw5Bz9wmaM64t0vzSpKgxyCuzCG5G38uMrLwLguv8yap
         es/32BddycSQ26VJhiRINI8pyT2lJrA+VZpENMgnS27aa/fMesWvf3NAz3h7GAcHsFdx
         zRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5HiYzFHc/9Xp6EzsvXqUwFD4ssSumNPG0+vT3T1mUK0=;
        b=CdGAMcct4IHf0lqPQ+0k/0e5GNIjB+g0AQu4hjGjeGMREvZWHCFX35HupChKc4LZQC
         utMebPdfctB9g8iLjuHFmzBLjdKXOKJhtmvuBKtHxjmmaTWC1deVrgSwIfq1abFDwDpF
         0R0i74l8083VrtN+99UHoiN5fOsljGG7BL3cb93G3ZHu1WQRlMhBUrjTWAcGJthI7+tc
         M1weuxmCSw0GjfqckXAUKFHvgeMNjdGJLp3m7xuvHPtQaU5iga08QA75mmlOTVsL12mI
         iu/MTeSF64/g/nIOLidB9Aca1HRfVy5B7BaHo+dRqiOx597gD3zlcyuUSSCKUSD+mXoy
         gUKw==
X-Gm-Message-State: ACgBeo1pG2RYJLPPNvGhfnj32JzJJilQJUvwb1xC3nGkNdDWMnPlh3lY
        ig7vVuNvQRxtmHbFVzMKkb8HGMpxRDkyAXlx
X-Google-Smtp-Source: AA6agR4xWcrV3sC9joYRds2dRPdF5QYf+E49P5o/1hiFlngFTfZ6XBB3+3ZXhz0ewEzcMt8g6j4ThQ==
X-Received: by 2002:ac2:418a:0:b0:48b:aa2:1d9f with SMTP id z10-20020ac2418a000000b0048b0aa21d9fmr12284425lfh.195.1660218793156;
        Thu, 11 Aug 2022 04:53:13 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id t21-20020a056512209500b0048b37616f13sm679005lfr.206.2022.08.11.04.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 04:53:12 -0700 (PDT)
Message-ID: <f47638a3-08e6-2ea0-5e1a-b482f3687142@linaro.org>
Date:   Thu, 11 Aug 2022 14:53:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] scsi: ufs: host: ufs-exynos: staticize fsd_ufs_drvs
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, avri.altman@wdc.com,
        bvanassche@acm.org, martin.petersen@oracle.com,
        chanho61.park@samsung.com, linux-samsung-soc@vger.kernel.org
References: <CGME20220811114614epcas5p29046e326acc8d13824479504e80a0d49@epcas5p2.samsung.com>
 <20220811113550.31914-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811113550.31914-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/08/2022 14:35, Alim Akhtar wrote:
> struct fsd_ufs_drvs is not used outside this file, so made it static.
> This fixes sparse warning:
> 
> drivers/ufs/host/ufs-exynos.c:1721:28: sparse: sparse:
> symbol 'fsd_ufs_drvs' was not declared. Should it be static?
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 216f74e8059a ("scsi: ufs: host: ufs-exynos: Add support for FSD UFS HCI")
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

This should be static const.

Best regards,
Krzysztof
