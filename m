Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87831EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 15:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbjGEPKe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbjGEPKc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:10:32 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D021709
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 08:10:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d804c7d14so7808706a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688569827; x=1691161827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ojk3pDsa51gaTaxBdleXM77SdabdORvtbCdzylQ7aXw=;
        b=VM+h4H/I+ISVvdSZF7+xa0kUZGQpMhrHfPbNPpbll3S69f3ls36LuXEqbCX0sP0mQz
         rsqXKouAkHWZ7YDP0FPt1gDaXBTwOn0SLGkKb4Om0en+IcJ4jnm0MgH/0gueKRejLFyX
         fqqtLfH8PuzpHBp4EQr5Y62sVkev00Ydy8dfLH9NrsWhXuBhf/eJZs//zR1yPVKY89xF
         bL4U5IWxnz3JpOs1RnNuIkpLZ3Rv/likz0OwrlQkyUjHUnbHDpahsW52mZLVGcyjN6Co
         sR2sgW+7y/x/+5p7tUPcphzffGhazJCPhzZGEcwhY2i0F3UFr/izu5sbrRPL6ad+GuWa
         mdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569827; x=1691161827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ojk3pDsa51gaTaxBdleXM77SdabdORvtbCdzylQ7aXw=;
        b=bCVh6IRJ7Cdv6o+s376Tm4yszNkCqtUiIdl4XBHH/iSjtIqDBXn9IEV1R2vARYmuH1
         jicqEUHEZrzSb1Nx0YlRmd1PEf8DKX2oMZeyHuvWyTWTWdfWxuiFmcOPs+L4UTetjE3J
         KsGbiER2n1967mZh0NosSXgMfMwT4WyC9c6CKvS9P1QoKT7MuehQM183STqoNtl0CZZ4
         H8Skzm5SAov5AYo6GmvnQ3vW9V1DH7aUQyRy16BIh8bwesNAtm7tUOFkAzFmxUgOiypB
         TlVjiLIZjqC9BJVRH2eN4daH6mLLd9w63RoU1LLyYk2GTIEXCLV3AEVeZ58GozRYdOk1
         aW3A==
X-Gm-Message-State: ABy/qLb73pxBX/d9D2PB1JOokIFLZqXAVTDtEQ0c1wKxbxPkTaTF/cPG
        iGYbZt6G1xxeOFUPNPRJCtH64A==
X-Google-Smtp-Source: APBJJlHDC2b8tDc58SLetk9Km4GvR9xb6KBbjGGP6NVaYSdVWCr8mOuYLPQpZcF/aAvoavG302aeqA==
X-Received: by 2002:aa7:c592:0:b0:518:7cf5:7ff8 with SMTP id g18-20020aa7c592000000b005187cf57ff8mr11568239edq.12.1688569826896;
        Wed, 05 Jul 2023 08:10:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402181100b0051e249f3dc6sm1627164edy.72.2023.07.05.08.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 08:10:26 -0700 (PDT)
Message-ID: <abf11e52-c7ff-a3d3-8886-1c61d04fb599@linaro.org>
Date:   Wed, 5 Jul 2023 17:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] media:Fix repeated initialization
Content-Language: en-US
To:     Wang Ming <machel@vivo.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
References: <20230705142142.3526-1-machel@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705142142.3526-1-machel@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2023 16:21, Wang Ming wrote:
> If the first report returns NULL,
> there is no need to execute the
> fimc_capture_try_format() function
> again.

Few nitpicks only, as I don't know the code unfortunately:

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: Wang Ming <machel@vivo.com>
> ---
>  .../media/platform/samsung/exynos4-is/fimc-capture.c   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> index a0d43bf892e6..5ce2f04afa1e 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> @@ -825,10 +825,12 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
>  		tfmt->height = mf->height;
>  		ffmt = fimc_capture_try_format(ctx, &tfmt->width, &tfmt->height,
>  					NULL, &fcc, FIMC_SD_PAD_SINK_CAM);
> -		ffmt = fimc_capture_try_format(ctx, &tfmt->width, &tfmt->height,
> -					NULL, &fcc, FIMC_SD_PAD_SOURCE);
> -		if (ffmt && ffmt->mbus_code)
> -			mf->code = ffmt->mbus_code;
> +		if (ffmt) {
> +			ffmt = fimc_capture_try_format(ctx, &tfmt->width, &tfmt->height,
> +				NULL, &fcc, FIMC_SD_PAD_SOURCE);

This does not look aligned.



Best regards,
Krzysztof

