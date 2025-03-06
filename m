Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F142040BD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260252; cv=none; b=VyGgke9xIPzNUr4z78sWscPr7nVEsCMr6eQySZx2M4cShMSnTqv70VWelzWX+Pvuf6rtEUMD3F/BFeV4bkw7a3zAzPt4uMr5F5CHixsYthzqzM2DvjgtWVAMdVAJXMpZc1SZUgjN+86p5D05kebKePylNesM8uWNgtnAxFXP0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260252; c=relaxed/simple;
	bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JpLGunCQsORFX479LyD0ZGEKzbAh41ZGqAK/CRUvlcTLAQ8cij+2l2uJKfX0J843m9cbq8esHM2sV1c/pymrpgEaHfTE9n1jlvBwHz8uDuwUU99GVj/4PbPPY0J9CrlJq/+FA8KArfVtBcGRDuYy7B9WjmzoDuCkXapnXNqdlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i10MCi+E; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i10MCi+E"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso755119a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741260249; x=1741865049; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=i10MCi+EgS5KTWmcXCV/WkJC60/Md7pToZmf19bqbFfI7m4VBt1MjVrshSXrxRd0dz
         zCEigUnse5E+iP2SmisaqsjVV2iQ3x+Dj5vJ5McCTKFvHY/2gVJWYEMZk0BgCJlCbVBZ
         6u1jztiqZRnyU+EIBiOq3XlgONZ18PvwoGRMY6+UZCUKg5BYuloS8agVYSRtm24v4EAg
         58O/GPXRShMKF0uByALJpNRmoeEkmCdrqrEQeZI9VOjxsGtr1yM++GWGyWV3dglyIrMd
         wnAJWWtvETybHHUKN4896f2rEAaR4yDX8cPdLjZWNIiWH7usGpZPjgTYtzXqHf21E3s3
         iChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260249; x=1741865049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=EL1wt7EW/k43K24DEEedCtPUhMOVW88FFCScJH9qRBOBA7t5CZS+eBCSWFhMigEv+I
         +C88bkrqwg2bWJ89IOeJpVYVkFulKVb9NTfoAvEEloI1vyyCRRe0pxXq/kbpssMO5mCg
         b4p+FPsWNNtTiQZ5qJis38d5tZ5Tn0EWCfVMuXIeM+gcMY+kGt4AcP9rkVwpknOw4tDX
         qgNGngP6RJwhiTNKXBtwtm7rWY9bi2XdzEJ271E04IgZFk1eqMHwN9kuLUKfFunjT+Ol
         b1vxrLONEuF6KaA9fq5YsERqU6mARlpTJr4slYuTHr6H20Spz6/r626f1ENVLlqKx0Nc
         2uog==
X-Forwarded-Encrypted: i=1; AJvYcCUDz8j/fE6OemVirMkVfYc84T9m8pYchYAgsqK2IqIhK+V+mcdyYAC7h1Ua+Ne2DxdIhL+qA3IeRYgCLyg4PcU/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT00O0ohbJANcl+pgmL2WLjbS/EqWpiBh2pzpi+qZMV30ZYLkJ
	peTK5dz7e/zSPdJUgy30JU0Zk5ImH/kGrfjjZQEoJfwXE4Fh/xucDrEi7Om1cOk=
X-Gm-Gg: ASbGncsm8gsVB6BaI422mGxQrUZQ4Q6EVSk7WBHXuisL0ffbonMgXhSX+XcEbiOMGde
	I77S3avJ7aAruzK/jbrKF/KTVg+Auc325bRnrCoUs6hHNKJ2+o/SqngaOwohbmM7XKIahGAt3s2
	JzV+9Quaswx5eNvrA8R/M2N/zGSMwlyilm90l1JaELpBU/uu3tnVtJieL2OeHVgH9kODNVGE3NC
	ZzEyTm8mlidq0V/S6FgWsZQiC53qKLXm3KmAHIr0BvzE5rI43oCb1cvX6O6/+YWKAKHNFbtx3/l
	O7DwLWStjbOPMsmlWag7hBT3/LGctkHwaRx66nciYT2zxDvo
X-Google-Smtp-Source: AGHT+IFJXG+ZAc6aSsP/TLrdtpd9ymEZvmqs4+Y8AAQtnIEGb2pYE1iRRI6PfSoONQjn41daLbimcw==
X-Received: by 2002:a05:6402:3547:b0:5e4:cfb0:f66b with SMTP id 4fb4d7f45d1cf-5e59f35248amr6527924a12.7.1741260249102;
        Thu, 06 Mar 2025 03:24:09 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a194sm787181a12.59.2025.03.06.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:24:08 -0800 (PST)
Message-ID: <4a200a7bf5f39034ce206a6c9240a307eadd45af.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 11:24:07 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

