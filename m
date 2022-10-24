Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C256FA373E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiJXOQY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbiJXOOR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:14:17 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D33265EA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:54:19 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id c8so5702111qvn.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nP0GRqUpor24cOH1tEBiHC87nojq4fSpk3LI5p6Ckp4=;
        b=XRBGZO5MVF7CI4UHFcrvg13XdwBso/2nmo2YDZ0bH8OKQiAlCnuKJ1VZoAxAlbe7vJ
         CAYuyde23VO9NkEY1ya6fzkz+7YHvguJtz5ssVwJ9jH227mS1GdAtPuJYLQLhxcL0ULx
         kEbBVHMdRY4i3vRhTbUs0VWPNaACPKBDC4GCmv7VR4CteBaHMRsAFmBn/xx6km4G/fm5
         ocJBKWOxYTHGr6ACnUeDjREzJgADKB8gyXMSHNb/FNj+ImYg30hzOfRXxxiaXVVfx0/W
         RASu/BGO4XV0u/9yHpr977xZ+FhtLAeiHgHDT7n7RZDcYXX2aTBSYMd4O89lgP7pDqrd
         N1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nP0GRqUpor24cOH1tEBiHC87nojq4fSpk3LI5p6Ckp4=;
        b=l1Xjn0zgqUzRibFVjRJSh1wnDtJJ0zvHAeiARkZBktSBc+14q9DtRRAfkX30m1qeSD
         wmM7GOc6AVCFsL1FrgBrB454xcIKz42eH5/tK5inMIytR9/jNQ9SECC72s4LXL+Snosf
         hryhWZbRA/EVLhnENQhgFv1eXpB7XUsgJNZfbEzyp2Fv5krGOQ6ZumugueqMqFoQxMPQ
         1D0QypR8/x5mxiZ32g/TRzuENq6+xWx+TM6HwL8Cx4HVHHX6x9Shh8IkDn6J/yrvpZ4r
         ypIUpj1DQmRlB2CbtjIGFO9kIDrxwgkp8Jpa0jkV+VjaFXhDvBfwL1bQ4uT7Y67qOd5R
         +z8Q==
X-Gm-Message-State: ACrzQf0JPNzXOySRT7qQwVuG6qWQmHyD0H/TgD7oZPT/mJPNAB8DvVWb
        TFrtWmyuEYVLhMd3GllxrWBbyQ==
X-Google-Smtp-Source: AMsMyM5pEMM2Bi7JxVx/uhw3V7bjtZquIqMyyGVb4C9x3lpPLi0aOW91eLJDguaYAYZqOYirlfbN/g==
X-Received: by 2002:a0c:ca11:0:b0:4bb:5f97:2d29 with SMTP id c17-20020a0cca11000000b004bb5f972d29mr8985693qvk.63.1666615926276;
        Mon, 24 Oct 2022 05:52:06 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id x7-20020ac85387000000b0039cc944ebdasm12828196qtp.54.2022.10.24.05.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:52:05 -0700 (PDT)
Message-ID: <713fb339-ba0d-0513-facd-cb79d1c68584@linaro.org>
Date:   Mon, 24 Oct 2022 08:52:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 19/21] spi: remove s3c24xx driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>, Andi Shyti <andi@etezian.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-19-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-19-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was removed,s o there are no remaining users
> for its spi driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

