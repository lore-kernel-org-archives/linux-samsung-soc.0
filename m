Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CB2FA3741
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbiJXOUD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237021AbiJXOTi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:19:38 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F6C62C7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:57:46 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id x13so4930483qvn.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2+QOBJHHWEkUuBFr42Se70cWpXSG2GrMADo027oyw4=;
        b=twiVT3I/Xp04E/nPPYGkJL++4wpd7f6aO/XY14XrZuBQ6+liUVkxms0B0/ObKwxqVn
         ERYmgFExovKJTPtyoaKI9kGxUsSFk4yD/FrGV+dV8YLsKS/A+thiltu6Fk0k/HD3jmbe
         JH5F6e0vtSgQlFy0R5LeUlFKefZQOJ587B6fg/C7XagE5NZvLqMx1zplA84lLze6smOZ
         sN+FmFwyxo2UNpmwh+z3Km+i6e1n8kFSb2URVFpo4mSyCpqsqBC8WKDrsSAhS5vI/eez
         bf10JGgdBpC8Z697JNWXtQSWHbF7O0/UVJeddnrC6wp1igPhBkXHDjRp4YKG4jePeoEj
         WMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2+QOBJHHWEkUuBFr42Se70cWpXSG2GrMADo027oyw4=;
        b=ybHblYJCNvS35XDCjDEjQv/B5bPb76Xiw+TINVyAuObreCMpykLuUxSeYyO/lj/YwH
         ych91MOBR489e/J3k8AfYr/95N90qZki66ZMKx7EhYVZuDlhm0LSebh/1tAuGN8llG+g
         4M8XlM7nQ57kRwGJGthJEJxnqw7FQ16rqgbkM41ooITmN+p6O05jOTv4gLYO+lig+w/U
         ExE1AzS1ZcgCz9teXlB40JVcwdcq09NE3SGX4dztDbbJDz9k98o+ahGUtkfn886L0W1M
         MlScSlFps7T+QagaFPvx9uAGnbcDEHc6tMJybmff7DgnAIZrVvBRR+YvV85luCMYmSpr
         v+lQ==
X-Gm-Message-State: ACrzQf17DhHCGq1fQKKpCIoQRhZr3w01TWn6TnbGjjlAYG/SlJAKpoCc
        xbCdebfkTyn98wloekrv7DoYDnxQrKtM6g==
X-Google-Smtp-Source: AMsMyM65K/QiQBmdOnqFxK02DN1KcRfzxU7Rx1KWoB8ExgLy5o+iiTxWE0tO74yK/1cqrwLKTai3Xg==
X-Received: by 2002:a05:6214:518c:b0:4b1:88f8:b6a4 with SMTP id kl12-20020a056214518c00b004b188f8b6a4mr27713895qvb.0.1666615224453;
        Mon, 24 Oct 2022 05:40:24 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cf17-20020a05622a401100b0039c7b9522ecsm12839772qtb.35.2022.10.24.05.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:40:23 -0700 (PDT)
Message-ID: <1264967e-cf78-d7c0-c361-6013cb0ea238@linaro.org>
Date:   Mon, 24 Oct 2022 08:40:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 15/21] cpufreq: remove s3c24xx drivers
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-15-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-15-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All s3c24xx platforms were removed, so these five drivers are all
> obsolete now.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

