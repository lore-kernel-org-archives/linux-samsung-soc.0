Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4958FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Apr 2022 13:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240042AbiDINmR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Apr 2022 09:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233597AbiDINmR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Apr 2022 09:42:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EC7393DC
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Apr 2022 06:40:09 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w18so12928222edi.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Apr 2022 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=qiSgXLwM6q4TIzAXXqAelmGFef+Z9+63Wglq0NX+r+c=;
        b=nJZKx7yIAPKlFTq0NtwIEEGbNkiM3vLeUeI9WIffObNr4Uj1vZNAZkMdvKDroOvZ3J
         YNFhaTV5uMR5cusAz3VRoJaEHhsqoFs4yxUHM9QJ3EQ03X+moEq3j6SQS13h3TXY0Gxx
         y9S7rS/a3S4xJSa0HUt54txciie3c2kMN+UAi8dWKtIZRc/iojLvBVSJEbWN9OE1zHMq
         tZRUsJ5ASFghyfk16I/2NXWFhS2uHhDd6LSvHE8mv/I8PIw1bpOkx/B9MphzsV1/H374
         fi8e7mLEOti8Ulm+Ji06HahJoPOuSSUJkPc8pz9oohHhbIK6adiEXjnHyduRnhpLU5Es
         XJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=qiSgXLwM6q4TIzAXXqAelmGFef+Z9+63Wglq0NX+r+c=;
        b=msEHy2H5ZA3+L26FUKIphFjVpkXhS89ej2691mDVHUTF+U6EyHKMirqNu+vfXff8JJ
         WN7G+VgPggiQ25Byi/5WkDKPI2FOCh1SzX9XiATw/1bNxyZGguNRhRlo1OD1BZ/zfiN8
         owoRuCyY1Cfv8ngt9f8xK4eKrFpZXFphUL5RllOb4YRcRgvhMO0EkHl1nn+SQgWFpCOZ
         hc2En0h0B3ojFHNxC8UscdLWqa5vjXyhcSLRoBn0tdcbpF4iO1s3guWZeAApi6o9du33
         ojHrZwvkawcLFTSTJ7rU0DMbofh7PXLDcS4DU+P8lMuJPHORLH3uSu+LDtrJ93UbeeG8
         R83A==
X-Gm-Message-State: AOAM532tMJwVtFvflc2P1OS1Gwnrc8EbFahTPbmoipQDh+jEIP2q2w1i
        xR+6/N/tWXOFYl1pEIydOa0=
X-Google-Smtp-Source: ABdhPJx6Y4RR57tAaDRtiBPnmE/+VP0TK6TiQZo6NBHRuDwOHmdOa9kU4aKz6waoyDZVy9aiSxfFqw==
X-Received: by 2002:a05:6402:27c7:b0:41b:51ca:f542 with SMTP id c7-20020a05640227c700b0041b51caf542mr24515822ede.149.1649511607919;
        Sat, 09 Apr 2022 06:40:07 -0700 (PDT)
Received: from adroid (027-177-184-091.ip-addr.vsenet.de. [91.184.177.27])
        by smtp.gmail.com with ESMTPSA id p15-20020a170906228f00b006e86ff7db33sm737991eja.68.2022.04.09.06.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 06:40:07 -0700 (PDT)
Date:   Sat, 9 Apr 2022 15:40:05 +0200
From:   Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH] pwm: pwm-samsung: trigger manual update on 100% duty
Message-ID: <20220409134005.GA12218@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

I have some trouble with a pwm backlight in the p4note and I'm not sure
what the cause is. The problem is with setting the backlight brightness
to its maximum value, which will actually turn off the display. All the
other values seem to be working just fine.

Looking at the documentation for the pwm driver in the exynos4412
manual, I found that for pwm, the higher the tcmp value, the lower the
pwm value is. Enabling debug logging, this seems to be exactly what's
happening for values below 100% duty, but when the duty reaches 100%,
the tcmp is zero and then gets decreased which causes it to wrap around.
Looking at the rest of the code, this seems to be expected behaviour and
I would assume that it should cause the pwm to never switch the value
from high to low which would also fit.

Now I tried around and found two solutions to my problem, one of them is
attached to the mail and just triggers a manual update if the new value
wrapped around. This makes the display behave as expected but I cannot
explain what's actually happening. Another idea was to check the tcmp
value before decreasing to avoid the wrap around, but then 100% duty
cycle is not possible anymore as the pwm signal will switch from high to
low on the last tick of the counter.

I'd be happy for any input on this issue.

Here is the first solution I found:


Trigger a manual update to the pwm chip when going from any value to
100% duty to avoid the TOUT value staying low.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 drivers/pwm/pwm-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 0a4ff55fad04..a449e38a24da 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -383,7 +383,7 @@ static int __pwm_samsung_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * update to prevent the signal staying high if the PWM is disabled
 	 * shortly afer this update (before it autoreloaded the new values).
 	 */
-	if (oldtcmp == (u32) -1) {
+	if (oldtcmp == (u32)-1 || tcmp == (u32)-1) {
 		dev_dbg(our_chip->chip.dev, "Forcing manual update");
 		pwm_samsung_manual_update(our_chip, pwm);
 	}
-- 
2.25.1

