Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B43EEAFE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101226; cv=none; b=NKj7V/psIdj7ZK0vGaQ1VC3fyhNHgWYkDrv/MeB2WdgwDLjjOW0zb/KSuM8JCjAccT+DrEDNdVAgYpKDYclXwVIf3EvjDNXJcQ4ICGEeJmm0q0dO9yv7YLMQsLuKS7pUcPUWD0QQvzyHUb3PgmD4iLEGkqMsrGOIc8JjaL2pYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101226; c=relaxed/simple;
	bh=UukKI6xGzmfju1XPEjRWc04LcqZFDCcGbwR5vQmBgtM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OVdJJIT7ggQKiOXUJz7p5Gh64YG5V9Y+FYdZfANHlJhf2DGK6GqN7C5hO33i1ZDGyreFZZoVfpVdudH+jvCc1gVus6na7BdTqG8NRos83ni3Th8v/WHUV+/WQF00/DaqkAUv53C5xe0LtitTAPVBJWXI8jPLWS52JygyxqeHdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t44721Cc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t44721Cc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a14580111so1547824f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779101217; x=1779706017; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=t44721CctlGWpz4UQVtE9DWJinSMRTdzqhYrM1zugYh/prJ/gpxkEBbm2mO4OFIW6L
         4IfzSa0DxPiP0JHcMfyjSQvHkW9wgdNdqditXiYfx7ORUI2zFmjsJonVZ6WcXPfMPJMZ
         kcqUM0C0m2RWn6wfZ7aOB/TEcWmLNYfaatYiqO/Oun0fzPM9DAMFGotlLxzBINF8RpR/
         GVLFKjwOkKeYkY2annp8euADKm0rXoHu1O5PmE2LNcjNQOP5LmM2/714EvN2g/4CNi5+
         T3GuEb1yQTkN/xMynfxt7jQz3u5P5/o5oRz+P+Q3ASs0g5j55AV7HlgHO7XH4fBsJgTG
         TJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101217; x=1779706017;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=qYc9om40Xv8aNwraPcbsUmkXd4VJxfT+03oVoR1EZejzI+8g+KQWbevPa6ALcoLtu7
         7JyjdHolow6eV4+dnpezEM6vfWFc+Fh627VVn7IYPCI8TAWbqd1s9rd6zNSp/uiXUqzG
         k/PEcH7siWwrpBiotNtQJaJVkxU8+JyJpcq55UT0M/QbKh4JZrYPrBoTatogVtorMleu
         IDLfH+faelvIuYMK36Bs3Afjip/ZJv7VNo/0Hywpva2XGdHpuB7miqKsItqntvFC/BHT
         Ay2CE3B0KODtdSPD8cp2ahXaq62/SFLUAWb+3OFxGqdxKh8MfaGxzh1f0BHuK5ugXCzx
         18Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/QoUjpEhKsAvXlweLG7uVhwAnL1rxob3LsiU8z+c0C+kVBkt9Lhf1nwd2ZZsKz+AUtJd7IJkhS/+zlqkakVwLf5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHl8HR57RsWTPeYEeVl3Kt3+Uf1gkY08sxRQxJN1kX3EEayZv
	w0RS+nixjZosOSOFF/a3kttLXptT64EHoLUDceLB2N+jFxwWjF22co94+5TrZVuPKp8=
X-Gm-Gg: Acq92OGb9n5tppkw8ZfUDLmiS1tqYH9SnsNOoEdfrm1ymcDDtU/+xL+0WYoQN87xMpj
	S4r1FIYMSYpmxxJoNa/IXUbKhUV9XnAYEoT1zyC8XdmcOqw0gxTT761aNXFvmb7wHbAuImCswz/
	fhs9qlrVKdUvjMVuWcGn+H1IIRQiJy67CADZqygXy9PJO4p65MDr47Stc+ga7/1K6JK2EyM//Og
	NL/JdBt64NsTiFqqnYpUE88nEl+aQrD2D32/IFTpnTKwW4H8XkW0QibOnxQQsjSkJ0cmq4m/E80
	d1VAEeqKd0GK3YObNhGkJyr5orU1SFi1W8yAWf5Ca5LqaYx4mBBctBLSTJQXvhYFyeLCDkgqtv/
	J46jUU3fm37c3QTHDxmnfQnO/NFVj+KHC4UVCS7eYy+hS57XNh3xLHaSwQe49fllUVktqRbsprm
	3ljTNmFwqyNFw+cJn+Ebz4k31LGQ74tPofQHsPnQGAyG2iIVTF5x1JtG9uj7+vrUey8ZUTMgV1E
	yANZPVgoEN+jul2kolKMaqbmNWn
X-Received: by 2002:a5d:584f:0:b0:45d:484b:ec10 with SMTP id ffacd0b85a97d-45e5c5bbe5cmr22863944f8f.2.1779101217129;
        Mon, 18 May 2026 03:46:57 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm35777201f8f.30.2026.05.18.03.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 11:46:55 +0100
Message-Id: <DILQQVKC65OW.105KDQXOG4PN5@linaro.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org> <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
In-Reply-To: <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>

On Mon May 18, 2026 at 11:27 AM BST, Tudor Ambarus wrote:
>
>
> On 5/13/26 2:12 AM, Alexey Klimov wrote:
>> The Exynos850 SoC contains an APM co-processor. Communication
>> with this hardware block is established using the ACPM protocol,
>> which handles IPC messages for clocks, power, thermal management,
>> and PMIC control.
>>=20
>> Add the "samsung,exynos850-acpm-ipc" compatible string along with
>> its associated match data. This includes the specific initialisation
>
> s/initialisation/initialization=20

Why? Where is the error here?

Also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/doc-guide/contributing.rst?h=3Dv7.1-rc4#n176

"Both American and British English spellings are allowed within the
kernel documentation.  There is no need to fix one by replacing it with
the other."

Also looking at git log, plenty of _s_ spellings.

>> data base offset (which differs from the GS101 offset) and the
>> "exynos850-acpm-clk" device name required to properly instantiate
>> the clock provider.
>
> The patch looks alright. With what client did you test it, cpufreq?
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>=20

Thanks. As you might be aware this was tested with acpm-based tmu
and with dvfs/cpufreq both on e850-96. They are local changes here but I
can't send all of them in one go -- I need dependencies first.

Best regards,
Alexey
