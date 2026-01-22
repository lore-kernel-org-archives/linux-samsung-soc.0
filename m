Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914F3ECBCD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078346; cv=none; b=IJRLa1WEmFnyQVKResBqE9iww4CczZ40OxNy+4z4cDVlgwKYPrbmjwTvuW4LfzF9mwxZk7nLfPKeb9chl9I9XAXNTcMrnvEwezUDbWCfzxME7NOfd752UIcz0F/2+irBrdlZvtCKewDrLbyIavIbMO19SMW3RP/3ayzCIOdcFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078346; c=relaxed/simple;
	bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQdDUCSlLt7VLRF/CoA0/QwHBGYkxU0sgDmFzNVvwZ3l9tDUagV4t5CQQKS6QPnfaQXBjeMDISaLTrTrvPcehX6ksZIfvDjruSH4ymthXZChfAWL/K0okNdpq8VmzhaJmACjlmoge/c58Wb9JprB6i3U1A9wN0DN14Gfu2vM6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sfdK09cM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sfdK09cM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435a517be33so513356f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078342; x=1769683142; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=;
        b=sfdK09cMA2aGNzP4RDKOZtaMkShYkVW2uduv/39f2Wcnh5/stkNdN0dtUTm1dtMnZE
         kzOGTEfuVOzhUka8b/zQJ+hM5KQRaNl2jVEayOLTzrm3MdqwOhcsu7hx1c7+fKqUhIs5
         izyJSDk1DYZOIcOmC0p73g2XIayEHBrwOHG3vUP7ZnqMEx9w6v2veToLsOjHRMZxQcZ7
         eeEMuPjw9wmBd76fzM/2ug0g6q9+SB5YfYbpqBHxLm+0PI70GVpAaV1yhPkQSpMEXDX1
         f+nO6VAO5MhzKZtit0nzQfWjo/0EQC3keHl2DOqtv3683Wy9kqYnukxo/wARYMutxUr6
         71og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078342; x=1769683142;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knv3eV/uPl+lWimlwaG5qjUbDF4tZn6R2q3+oaVVNBg=;
        b=bRqcOO2IZsz4C0rjBpKVoGXE1WB6MHKvxWRNzRKFhX1WkyY1lPmX51g/0JZywoPAUw
         1Xw2FRmYm985pSoieBlX9LjJaoVvMRYwxuOZrYz4UPvFFwrcF/igtFo41ZVv2WN4ujyC
         YARYjSAA1dA2X2blA2EZ1SWsbYGVn+sczIYRUMJBocNoYIK9lTao9pckVXFPqDchOiK6
         U0o2UXyEWJrYwHW9ZcPNqrvrD7d+AmRGIpjgjX/yf7Y/eU4MyLoSTlfeqyoiyp751ByD
         appMi5Y3p8rInxKwpe/xJeHL8f4mIgsI6+metkWyrH1yWV0lbgr8IrZcPAVYwQcFcfA3
         b88w==
X-Forwarded-Encrypted: i=1; AJvYcCWtQAwkKyhBOxtF8XeqkX84SqPu/ijedZuBS/KPrNlotHSXEa0nPk8edwUnJhUoUrdEASFoT1EhILFDF1PMhVzGpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK94EBJygZVESV7eICjCZYr26Z3w03uUK04ai08lNFf7sP4XhJ
	5guEfYVUSvK67cufvyGzwHezwC9X2/zrVzzFG6ix5TbITgNRFtUt7KvIhugdQiORnfo=
X-Gm-Gg: AZuq6aI9+s1ruadObzjvrowutMZGEAcUw+Vi+FOUqnEgeJhHPA3hX+Y/nnEzIwfQJfR
	ysUlDNpNImzlsAultmykFC2bJvMcuzpMCArDgYzccibfv3XaGErG/hXbF30acMQ48Wj+WF/d0FW
	aZOH3vS8Lo5ThFeMQh7bOb1IPYOmZ0KciDW1WW2EX+EMOxKzN3/mTvBCTrN9LgBDbzlQcUGLuYA
	BSXPrFZZNO7Dfrs9ngEedeFJfovf85+Jfns7aPEfAV1++QdUKxzq+SbKEGYURLW+rnGf+QrGNeX
	LiRc4ZMTLXFu0SDqc/s+BJPmLhUnOh7kurmF5vHqJPY0mjtP+4jSpHj4m49g0aKjqkNTbb6Adcl
	K8xfTLlB2y/xbK6D9d7Q5qAtgdgZqkLWKBgVa/ype0V67T57BNYYdImZc00cd1w37cRVxsvyreg
	DoM6/bg1cy/FetWAokeg==
X-Received: by 2002:a05:6000:ece:b0:435:a7fa:24ae with SMTP id ffacd0b85a97d-435a7fa2607mr2707643f8f.18.1769078342064;
        Thu, 22 Jan 2026 02:39:02 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm45475978f8f.31.2026.01.22.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:39:01 -0800 (PST)
Message-ID: <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joy
 Chakraborty <joychakr@google.com>, Naveen Kumar	 <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot
	 <lkp@intel.com>
Date: Thu, 22 Jan 2026 10:39:01 +0000
In-Reply-To: <20260121-next-v1-1-c18068b091b9@google.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Roy,

On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is disabled or configured as a module.
>=20
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking.
>=20
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@i=
ntel.com/
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3e5=
2d4a57b26a62d8d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> =C2=A0
> =C2=A0config PHY_GOOGLE_USB
> =C2=A0 tristate "Google Tensor SoC USB PHY driver"
> + depends on TYPEC

Can you make this

depends on TYPEC || COMPILE_TEST

to allow some better test coverage?

Cheers,
Andre
