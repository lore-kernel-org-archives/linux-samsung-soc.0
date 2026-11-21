Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287973;
	b=w93sEgkirfW4SssYzVnhlKj2dtOhpuVq4Q2YQU9vCgrw4/bHH8nBomhmCHcH6ir43R17
	 nuVspPVbjHmDHCukesEUGOjLTDZLRkNwKE8hM4z8PQDXpO9bbjA1zsRIf4OnMfE79kFGh
	 U1QdfZJUhUrurRT4e5YFzBi/YaMPCMS1qvmztbzHtx96+T9x4IulcegCR7litklDwepIt
	 be98147OBhP2vNqD6wkflu8H3kEhi8sW93Yo1892L8lvkUmvARBupNFgd6k2SkfpVZeK5
	 bUMEk/Exa+tzssozi8rP5YNKqY6AokGYtsx3Im8+lZIrd3Q9r6o7yUgTjVk2PeRd5yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
	b=LFh1aXj7bdwnd4Ha2wJed0QzzG/pFP5s2wtulXubZnYLrJrSaKaRWX/lhvTzCOw3ejPH
	 YIVmADLre87EmjIm3/jvIQXuowNtUACX/WzbTjXq0B9AYkY8FHwCGabYnarsG30a8GR8E
	 EZbwMsewnWOKgvfeyhlGx4Ncn4fqUeG94P4OFLBkOYtg+Gktnzp2wWgAAST0TddhcElr6
	 6MB41sXt+EUF20nd07GmIwKMXIhskYS9baLEVQz0mv5p1gKY1KS5H824i5b/8tZpswv7T
	 yErug7G3gIhbK2z1K9WuKuKMw7zjCBuMWmxLgBUjlVWmolOTNEr3yMbS/H88YnGHBZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106A606A330
	for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Nov 2026 19:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8106A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso19113385e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287972; x=1795892772; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=dRUFuQH8w4MMSrEuc/tUiHbAWm2e8J0TZVBrfHQOSMQQc0vMhH6D331bHZwmWI0nW2
         lOwdSLLGhfXzgXbQEBKpcvr4+PI3b7XJh4mhRWqOQcNiR7cWa5aPNcNWAzqLnO4DfizM
         opphh1/ieNCtEuzXfWV6VbBhb4yO6YmMnc8jznq9GO072dx30HONa2zs+cUSQbS8TJxV
         m+4h+3WjdKBDkuVYBJ3KduUxejxMzvESrVOUs2AqVsUZ5dslRzyepHS7zppw82DxZaO1
         rw9OiPKIfdAJwSEUOwttDjkpvJ5P6XfNisG/ZtDNOADkU2kxZdvnT4Ieor0Vy+9lLbUP
         RBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287972; x=1795892772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=PEUi2KnC3Anm5BFBq9FtjO79EokoYSM32hmFjs4y2yDH6s/ZOEktRHBDRxC1rcr6w0
         kDM5qAf0VcvRAGV1VQgONvV3p4PHi1xt7PvquklPrXia9wnIUaE98ZPDvUhBUiLGPji6
         Um5aiVgfMLtT+ZV6BmW5VZ+CRIQ+kp/RkSjNGblWF/96jxU6iKQwLFP8gXDqpaLIYk31
         xFGwwxTsRbL4zWeOWwuWFN6FxIXGNrK5BHZuEyK8TDaEeTMiuNm4qGHvmhmasCnFE2Mo
         JAC+QKDbKiiC876RjjO66Cw4zOCH8GGJ9ncVta/hcLkVw81eWbqvYDZU9EoLQVIdcCu2
         ZQ9A==
X-Forwarded-Encrypted: i=1; AL+hErG9mTNoIp+ySEPcrnrvewLojxY5WVHmNo81G/DJGNr8sNlsC4AYqXemcaUK7QmRRe07o/C2Gm1/ytMSOIJ9B5mx5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lFwX3hat4c0JZrjZGF2hrwYlgauCew6MvLp9LDReJDc7SfMPu
	98/hXSC+JTyHZF9mOZoZSZcInlxOtgBW1H9SY11WWuuS5jX9vs0zHkoW
X-Gm-Gg: AZFdTZc325iDZHd1MtnDSBXclM3rpW8EDUxt8w9X3Z7iQI9uT9yhHXkd7b3W46hAxfG
	VW0YMeT1khyKUuUOUHff9zHuhECE9ByNqfk33WFSmgHgJpfdswDS2NezZJpR0I4XAALnfM49IZ3
	ayeRQF6bie6ubgrRglzbl3DkG3MurjQmrrvAkHMNV7HJU640h3iP6+DktXkofNG/QNG53H32lwD
	sEBbVqO48+8cT+y2hCLILOwQurmZPMGdyFo33iI4eVHoq93JMvxlrzTjJ0BIdyqd8GwRXP+Aqlr
	YxsweqrRbo/JneYqkLkGIGghLRAw9cidrzaoUj1sXxfr69k0OqBOdQ0bnX6TVOWgk584yY/Y2H7
	zDi+wEYVTUsZhUPVttwflcqT0TaCrlEefDBi5eoPkwPsZQC0pdabJDonuZFEoxRv3p4dL3B3K7f
	4Zdr+rox/FS/CeIQwKfj7xchsEFNKASce4C/ZisE5yhig5Icx87On6QljrCLBh52DGYsLNfGQ+W
	kzu56XWxAXTMPUcz+NBDBnq4jnc/49o5+oX/BuTC4KiE63sITPJS2avNDrnr7r1PMLy8K98MEMn
	f1WDfweIKV+mgZ0tDHWdOQa0iGECGSlmSeJIbVY9BjtCOPplE86sVSsFbr8glwVg+7TCrxQRFLc
	4dP2X4P+iDy1rUeDhJF7kD4oHt1f1qw==
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb888106damr154232025e9.20.1795287971698;
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm148595925e9.4.2026.11.21.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Message-ID: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
From: David Virag <virag.david003@gmail.com>
To: umer.uddin@mentallysanemainliners.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Sat, 21 Nov 2026 20:06:10 +0100
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
References: 
	<20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series adds support for USB on Exynos7885. This
> series
> is based on David Virag's work[1] I had rebased it onto krzk's for-
> next
> tree and tested it on gta3xllte. This series also enables S2MU005 FG
> on gta3xllte, which is also tested.

Hi, thanks for reviving my old patches

I actually have sent the patches before [1], got some reviews, but only
ended up with the clock patches submitted and applied, and never
actually got to submitting these patches with fixes based on the
reviews (which have been sitting on my PC for quite a while).

I think I will submit my fixed up patches (the ones you submitted still
have some problems), and then your gta3xxlte patches can sit on top.

[1]
https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.dav=
id003@gmail.com/

>=20
> Please note, I did drop enabling USB on jackpotlte, this is because I
> don't have the device myself to test the changes personally and I
> didn't
> want to risk a regression on jackpotlte.

I can confirm it does still work properly on jackpotlte.

Best regards,
David
