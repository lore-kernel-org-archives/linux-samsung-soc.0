Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1568C357CE6
	for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755268; cv=none; b=blJ1q4JtwuhVYpGWu48KH15WW4zF5HYJNMlOBo8xFNkIQwYH4pPJtM4dTGdnVEWJl1c8Fm4Ta0G9owntyoUaI8SUag/A+L3Fd1bTDAHsyq4ih2dvTqDgLiVDir22Wo0xurwVPs2rKzORc17OAO501QyTfy2MyDfxgViq0tlxb64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755268; c=relaxed/simple;
	bh=gUnPJvqa+6hCH/9HCtTO8STc6X6BWHZ70c5H6AKWsOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYrLNKk/T4z785UMJLC/Idu5DHXo/5GlML9FO3vW7bbL0wjY3/k0M/ucM2Q/JhVkF15nIwcHvHQSbDzBOJbLgJChitjXILJ5X+JBJWNkB+rVTZz+AdRho7jLtwa12EUuUGMGqI4vDaYA22sXEyFWuQffgV9trJ0KzvsLenrSCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVUYdWB3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVUYdWB3"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c9452243cso15134561fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755265; x=1784360065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=AVUYdWB3WfvWD9/jCidP0U7zRkAI7QnX4kmNcHjB6Nosq4CWaZlW0hNhy2LM6kgpWe
         TWeOEWd21tnxJAl6DPVycHqgm9166I3BafNhzXVO9hS6LEulcv+AlPncKAl7GvVrR03Q
         iCvt2f7qMPGyswDv6RE6LdZAC8T7nBCACNeECjWvasy2/IQ6mcUH99GfG+odlxT5vxDc
         faI4NAbgRuPvGxueHmF2X4sAqU7TBPz2sj2hy41Y3HsZaAYU2w0jJYHYvY8gACqUio0A
         PKN2hjadzNTtEb4X+/A4fXYRXB4crD0SpHGqL5UMuZ2Is9WMaTouNVWbOrjTDz6nyty1
         dqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755265; x=1784360065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=aPULrWv5WBrrss5xZJbW7bsu1plNkyRo0+SqWfqtqhEXnvW96B+stQ2o2hpW5BOvGj
         Ierv4RECfchBi/pyZA2TG50HyGNbZ+6PgczoCaMw0x6p8r8Un0jflMXrvrP3DvA1bqJE
         1oHSkFPrw9/UtgNYTgiwTeT3GmG8u/a+PFhL04eiLTPhQO8wXdAxF3Jek8SQN6jhLeRs
         Aa92hL488fw20w+qC3s2sZZU61X7ypcfDAXtPdK2GaOzKjuIv1SU5ab6vpETrhQINcxz
         FGCX1l9ZJ8pQIcmqm0OX4UmNFTvKOIEukHXM66vQqy1O8oFQRjmYhO0MBf6SjIv0Jpmw
         ifRw==
X-Forwarded-Encrypted: i=1; AHgh+RrCNPD3UX/Z4AIpgQJxH2locK9+eh/s7iSadK9JfBzDRiPYRdG1zsGslIYKHsVSSlQLhHjMhQHPChwcY9/iNHSxbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeF2i4MxksR1wY8LefN8F5VIcEC60qnpPRmb54MBv8khv/tdz
	3SiaN7BmVKzpKAj6ZVzw69c+RZNA/4VmkHUYCNvPx5aUeJn9j18PF0YE
X-Gm-Gg: AfdE7ck2glNKGL8lH5eCPpA03ksuhrHEu3+3/AQn4UabfRKJPD/VqFEz1Fxn2fMA8C0
	CwNHJMqOxHFKEhPevUzgkOtXRC6GZVBhmIiOzQXDIxwDbIpn50SDo6hljNvL884PRY+yft45/Jb
	4AJATsVPCto/gcet4SNaqPofA7qnveoQWNQh4TZeV7acFHx7PAR2S6HgmXNXh1L+4NAjCkunpNT
	5cNWFr1N7AeMD4RBPr90ALPwiwmE7frI7OFl60gdBJcYMgfSOKbk6+22v+RTyACl75ZBArsRbif
	aCczAdCSnyx2XA3QaNAoPevW7hMFjfvCDgp+5o2CJeUuj+xDi+UtNuwH/RnTPSkjCbEh98w1OIh
	+rGZfA9cUMWYeoCGaBQNlpsRuAofvvuGKAWAM7ywhLQy6l/VoeXbfo38huc7IO921TyWEsWqG15
	5dsk9rHnJxw8lDUiZr6yiWl2cELbEcRavbN4hIQpOy6hX0ryB4zs9hZvpEAcWdJlA9ELn7xA==
X-Received: by 2002:a05:6512:3f8:b0:5ae:bf45:e3be with SMTP id 2adb3069b0e04-5b0236689cdmr321070e87.21.1783755264967;
        Sat, 11 Jul 2026 00:34:24 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb? ([2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm1117527e87.48.2026.07.11.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:34:23 -0700 (PDT)
Message-ID: <de1d491e-159e-41c2-b145-4d09db091031@gmail.com>
Date: Sat, 11 Jul 2026 10:34:19 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 12:19 AM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

   s/s o/ so/?

> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>[...]

MBR, Sergey

