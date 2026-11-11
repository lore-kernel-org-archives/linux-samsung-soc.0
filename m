Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391356;
	b=3TRnP6contuj4VeEBQ+FAmraLpJSrLUzRAABcqB9jADTIxLm4wQimcUqIWXqvdSoHyCu
	 od7ZLO4ezAGNtkHYsxfl/u8J1WPpqHZkhYbhLpTVOuAfYQ9FPR2bJoGfO0G0qQQK5Oqrb
	 YqwVE6hUWnpy0ErnuPSnydpZnAycgSGPBIf8B6vA7H6Zl9LXXVXyiwMXUG3G9s+wJMDHS
	 XFfU+okroekmKQ+AM+BBT9SYSV43Eo7HDdZE4+9nCNkqkMuriPFrcLP8K3Y3+GsrVeGkC
	 WhU6BdyrzT6jlA3bcUsraal96jFWe4YBgv8Uto18VbnP2ydWEMktgPoWfqk8UlrGsfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6Uf8NjTATLaSx0T6xJbOfk8n0GZJkRQt+2l2OmlV7/s=;
	b=acSoLl4ejIFrSJweq7MYHsW4Va70Kg3jIMdtjRpVUYBAcBD9/ShLbmw7qtGRt3NHD45g
	 wjPCO/Yr4zZ6goXmDZdRERzApJqGtyeWSeIEPmRWET5CYXooKVjf4C74I/rLxNC4AfqzE
	 btRZq6N02KdppuROlUPGvCYY9KzTbtftK7FDWEDuriNAdtYRe+9UIKnLLU3WOFhF4qJDX
	 gd0NyVHSprOIR0hcpjc9yRr3SpKCgXGNENexHEZQ8El7H2uNxVXZAg/X5SwbkXyzLFMpa
	 3q0BMcfplRDKCEsZwXXU08PuEc+yUPOnAx7QZDj0HqeBpPa/dCkU3I8Nh/htcTWes0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h0U2KI9H;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7C606A880
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 10:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A7C606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h0U2KI9H
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so2204043f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794391354; x=1794996154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Uf8NjTATLaSx0T6xJbOfk8n0GZJkRQt+2l2OmlV7/s=;
        b=h0U2KI9Ho3jaYsUkDK5Fn9tyFwbypvCXXUNlfq5rS+pYSn4ZWsgiwyV/pdkqvTjDA+
         z6ZKvdaYbjQ17EYoNNC+EFELKj1jdE59psVlK6fnVag4qu+cTVc6XqNnmtFgh7Vy5Z7X
         QnwyOkRLsdL4Jc1XSO2j/x3bC7y820cojw8HTyVPpGZTFHQFG3cIdL3eKPfWolG22ZTT
         uFnol787+UL2MgjSwk6ipu8tWjxFiAh7ey2AtVznp1Q6dsl1U8qFxm1aLzHWt8Qi7DVt
         MuAgEQ+Md/6RetRneZV8tKuZd+0Ywx02jhUTmncLH4XCZC2HC1En7KBC5mEhZLsjKlEI
         Unjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391354; x=1794996154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Uf8NjTATLaSx0T6xJbOfk8n0GZJkRQt+2l2OmlV7/s=;
        b=CK1Q0oZG9f8QFABN1jPxwA7nqK9gLe6ypsxEexVNHlZVLo7fEBfrYRSCvK+pyxzeQ3
         IMCn557mAUkKmV3bi/q3vpbAYvbWdlzVcq5z52ThS8mCrSLV38mMxYWU3ZTvoV4LXlnI
         XRybjRGlid7hWpCvf+VzGH/KNaT+62BljbafV22hlHi8ZxUxYB5jykkNHdLLsAtpew/d
         f9zAIxZnA9iXo3VrjRSuzXBhO4MCjsfUg3HfsiHRPkBs3U0eAzxt+2aUkbcoWp06lrh2
         5/cO0mSffrlitg8pHUv+8zKEzqBBi1TejXl6xORTdIDqxxsaowlZP0k14kbkR2Ol68BT
         6Whw==
X-Forwarded-Encrypted: i=1; AL+hErHc89ilUE86IZ3VuqjtzJBxYylOtBqIbBhvymQGPKEnZROYcnp+kM2Slz8XL8ychfYze+XVtyCFHaWgnZJBdDW0Mw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8QTeha3AOSt7YfeqbomfzrwKRkP47MGS8bp4O+WMF+yRJYsp1q
	0kSY179buP5yWT8/PsKQjdOSGhUvgCDjqUDfEy/lWvUoowLjw3wGetkbB5HWuFhdOJY=
X-Gm-Gg: AYBFou2q9ySiZw49RP5FxSHH2Yv++e7VcMgtdtRnLDld76D+loyD5AeUcTn+cKaNvI8
	3Ep/ATCHePm+bdb6Zmb1JG7xcA++IzEs9BFCnQlMv10ng6KWnSxpre4RdYExkw1QcvgQUooa43P
	palB8TV1fLp5sQnMdjsuSJRIeBDbc+paIa1nGoUKR7A6WMIZN5Gd0xxI+KHiY/kWMAKsqWnkmdw
	MhCBzaLYGXeS4Znwxr0yLtKAKds0pHOntRmSao95bR3vqKUhaY6AzCoscKrfJXFxPrUZZCvzXnr
	73mm1ywuRaUGmWHHJhgYHWFluUSePG7ztOJLT/e7nmglPKtwGDAo+NuWKWaeIUCAQsSFVIGX19j
	ZWpxxhE4rdddSO3WtyoQCOGfE5eqam2fO03XiXQ8pujRxD+hhZt71oJjC4oqwzy3qdbCr2Z0EUq
	cx8JtLxWvGCf5jK3YpZNGzvhU5Kijcji/b1Zac9Xzam8E/YN8DgGyfLAmn8Oconk3t8yubGEJOf
	HijMW5Ecl/QsFZbDfriXkPr1j+RC/wIj3KyRpMAK2/fNamhfPr0lD9TLQh1uNI3tDAZMQ32t1T1
	eFBXu3B4mdmmJfCHXm7zdfRZXjFS96H7ln1cqbQ6DlPMvA6n4+VvS2QOF2rlUA==
X-Received: by 2002:a5d:64e3:0:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-499c903d741mr3207711f8f.23.1794391354282;
        Wed, 11 Nov 2026 02:02:34 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm4941304f8f.2.2026.11.11.02.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:02:33 -0800 (PST)
Message-ID: <e7621060-bf25-4677-bfaf-2549fc5e6ea1@linaro.org>
Date: Wed, 11 Nov 2026 12:02:31 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thermal: thermal/linux-next] thermal/drivers/samsung: acpm-tmu:
 Rename platform driver to "exynos-acpm-tmu"
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
 <179389375857.1009794.283716939057872036.tip-bot2@tip-bot2>
 <DMRYQFZGG5ZI.2T97YA5MCL74Y@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DMRYQFZGG5ZI.2T97YA5MCL74Y@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/26 2:42 AM, Alexey Klimov wrote:
> On Thu Nov 5, 2026 at 3:49 PM GMT, thermal-bot for Tudor Ambarus wrote:
>> The following commit has been merged into the thermal/linux-next branch of thermal:
>>
>> Commit-ID:     ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
>> Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git//ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
>> Author:        Tudor Ambarus <tudor.ambarus@linaro.org>
>> AuthorDate:    Mon, 26 Oct 2026 16:01:28 
>> Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
>> CommitterDate: Tue, 03 Nov 2026 19:51:51 +01:00
>>
>> thermal/drivers/samsung: acpm-tmu: Rename platform driver to "exynos-acpm-tmu"
> 
> Also, the fix for this problem was sent here earlier:
> https://lore.kernel.org/linux-samsung-soc/20261020-acpm-thermal-drv-name-fix-v1-1-71f72280583b@linaro.org/
> 
> Why taking this one and ignoring the fix that was sent earlier -- this
> should be at least explained.

I guess it slipped through the cracks, as it did for me.
> 
>> Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
>> that the ACPM TMU architecture is shared across Samsung Exynos SoCs
>> (such as GS101, AutoV920, and Exynos850) rather than being specific to
>> GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.
>>
>> Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>
> 
> I don't recall suggesting this. Reporting -- yes, but not renaming to
> "exynos-acpm-tmu".

my apologies, it wasn't intended. If you have a strong opinion on the
tag type, I guess Daniel can drop it.

> 
> This was reported months ago and was never fixed in the updated
> series for acpm-tmu.c.
> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
>> Link: https://patch.msgid.link/20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org
>> ---
>>  drivers/thermal/samsung/acpm-tmu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
>> index 42b338d..2324efc 100644
>> --- a/drivers/thermal/samsung/acpm-tmu.c
>> +++ b/drivers/thermal/samsung/acpm-tmu.c
>> @@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
>>  
>>  static struct platform_driver acpm_tmu_driver = {
>>  	.driver = {
>> -		.name   = "gs-tmu",
>> +		.name   = "exynos-acpm-tmu",
> 
> It is minor but it potentially clashes with exynos-acpm-tmu firmware

There's no driver name for the firmware tmu commands helpers but I see
your point.

> file name. All other names in file acpm-tmu.c are "acpm-tmu".

I think "exynos-acpm-tmu" is fine, it aligns with "exynos-acpm-protocol"
from drivers/firmware/samsung/exynos-acpm.c. I guess you may rename
"acpm-clocks" (drivers/clk/samsung/clk-acpm.c) to "exynos-acpm-clocks",
but I wouldn't bother too much. If you have a strong opinion on
"acpm-tmu" send a patch on top please.

Cheers,
ta
