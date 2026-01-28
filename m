Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D473009D2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630611; cv=none; b=mcxmiF2BOxlYU5bmCHKFuscOPbVAG7+5N93eC7B7DJL4gH8N3GsXPsXoEEnw5EDgWEECWmHJlcU33GGyIZkBZDl+kR2I+IYAyZnSCmjBSDHTEX9TdHnSIi48v2cyWkgsWcGqfXlqKGdKr2ns3VAMrCj3OK2R40G6yFqa7MOWLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630611; c=relaxed/simple;
	bh=XUkUT6LBku13mYTEfvUUPRvgsUlp0EEMZv51VMbnBdA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kHQW7JzgmTX/FwBN/H1beIYwVlE5dC0kGuY+8PaGqFDiLZ1vFVBAM+5p8+IbwRxggF7k6r4o08VDiUzO1LtidwtW6H4JOT4v7qK64ZUf/nrsBpb7DZ0wJ/13GG7udetOe+PfF6YSqSRpcerfLIUaAO9rAOMY2byiH/zk8pxx4l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pr549iXG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pr549iXG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359249bbacso898550f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 12:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769630609; x=1770235409; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xfDqLnr78jrG2/XLP9Dn27y+jadR+KNn5dnX37UWvRM=;
        b=pr549iXGj0SqzRa8OWQDJwjHMdttIpeROiSZg3cSeQD1NeroZzStObo/6wy2G1WVMC
         vmDpw71OKojU1g8It8XVd4O/ow2M/ESkH+NTFhE4YBxImElagxoueMiMibu7RjMXw7Ou
         8gftAcwIqK8gYtIDCxjlNFu6C6Jjv/qoLP2NOGDAnsEte7WoJhhin2Za7pzvoSH1l1E0
         RackL/jzbpxe5qaCUYI4VFJohM21TkytqOUzlcFFSpxqqEp/fTbw7LHCv5fKycsKFpOw
         S8Vs8L+x6HW0W/PIqaN0AV1g3fy+2/yYuVIZtG5754Db3KrLFUvP58e/tVmiOzQWyeRJ
         U9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769630609; x=1770235409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfDqLnr78jrG2/XLP9Dn27y+jadR+KNn5dnX37UWvRM=;
        b=lcLkzV1irwopUr7uKUGRF9KYLVsvO85KKuQS+2A1E6OiyTdli26Jx9f5SIy2rD7k96
         ctlM8x00rbc7hCPIFgTeMiUS02mW3vlRxqq9vxbVq1MD21O2s8I2s8ecYoc/0vsgnGz/
         fbSBfBX8dd3KJk962fIV3x9+ONarue3y+7p+AJz0khS93PyBlp26s5K5tItROF6GxyTx
         UBMKwsxTl33MvOelzr9N2aHdEsPf6I5B+3xCe57wqzH4k2TQjs8qnqzfNaRUhkFEbxdf
         OBvKy6U0R+vZSb9z/AU+jm3z9USBFeWxGyQivluMS+95CSoxulxvKX2QEZet5EFGlrQw
         q8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHeDdLGPScqVRUQ/Sy7naT9cnAmr0NZTBovhCGrjNyOHskuj2y2QmTQDFxJQwdi8m44zcHY8NkLRJg6RfOEzv4yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJs6+/t29vvy+f6yWdC3kv6OItJWw7DMvsFoFm0cNfacB2Lrs
	dq8RJSHxHsaihdqs4spUJelGmHMu+oBJfzMzbbRpl3Yg0DRHWEy0i+1/xCap7yf73OI=
X-Gm-Gg: AZuq6aInNc4+I7rSI5u/xfXrZC1rTx8rl+uKJKttPA2Ka4xJLlRVVOCzwWYOqNfmThN
	yfU7Pex0xYT82uC2F1ob5VlcUpgCseZTKIV7wynrAOClHtHe3iNKxsw5pbSnJELer5yKsbzb2qo
	z+5IVCT1RQq1cC87WronRuE0lnl55Sao4FpYaFD8RfuveRYEiPIrQ7d5dFtPB41hfI1vL3ofiPb
	Nhsv5aj6qNvc2V8kmRbUcKtqQpdOrhOGIVw0NPGQxaBZ8c5RvKojFqRb2PRNtcHkkTiP/D23Qo7
	ssbyAmiHCU4eX1MrUbPeuKhICBfue0Be2XqoGKKi0zGiPyG7gAJBgdX937h5L7+AH40711nzxeX
	6Ya2tEvkUIx9vJw+JNdA394DTLgtEvFZNJ7J8GGOplzCvGBt4+h8lMtMRe2gsLkF+Cfq6g9dwQF
	hiTaN1XHq/ge5UysJ0UlLhfNc=
X-Received: by 2002:a05:6000:4011:b0:435:db9b:5885 with SMTP id ffacd0b85a97d-435ea0672c8mr948788f8f.10.1769630608753;
        Wed, 28 Jan 2026 12:03:28 -0800 (PST)
Received: from [192.168.235.30] ([80.233.75.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm9169904f8f.37.2026.01.28.12.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:03:28 -0800 (PST)
Message-ID: <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Naveen Kumar <mnkumar@google.com>, Roy Luo	
 <royluo@google.com>, Joy Chakraborty <joychakr@google.com>, Arnd Bergmann	
 <arnd@arndb.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Jan 2026 20:03:25 +0000
In-Reply-To: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
References: 
	<0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Geert,

On Tue, 2026-01-27 at 20:12 +0100, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.=C2=A0 Hence add a dependency on ARCH_GOOGLE, to prevent as=
king
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
>=20
> Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> ARCH_GOOGLE is not yet upstream, but that doesn't hurt.

I can see your point, and have no objection, but for context, Greg
had asked to not add dependencies on a config option that might or
might not get added in the future - ARCH_GOOGLE:

https://lore.kernel.org/all/2025121728-reliably-crabgrass-2601@gregkh/

Maybe an alternative would be to make it default=3Dn, and change that
default once ARCH_GOOGLE gets added?


Cheers,
Andre'

> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb920..3ceda9a20d571038 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> =C2=A0
> =C2=A0config PHY_GOOGLE_USB
> =C2=A0	tristate "Google Tensor SoC USB PHY driver"
> +	depends on ARCH_GOOGLE || COMPILE_TEST
> =C2=A0	select GENERIC_PHY
> =C2=A0	help
> =C2=A0	=C2=A0 Enable support for the USB PHY on Google Tensor SoCs, start=
ing with
