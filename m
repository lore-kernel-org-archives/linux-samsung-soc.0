Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9753BBC0;
	Thu, 22 Aug 2024 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724353057; cv=none; b=lexD7Lt8U77pRXnJG3/r1gktdnjtKZUQHdIEqqPVziAjAw27vI1M+Gdruok2fxV6EaBGZyK64wIxjWICLOtBar0MGshsj5+0MOrKHFZiekK9XlrT5DRIsICchq8cyVJAJj64auYogsC86sI0cbMWUU+vc2anUnvrXJdS0EeVFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724353057; c=relaxed/simple;
	bh=MtjKYRE04dmrNbD8z0rKJLoeLdrXZteqgEAdH8eTdRk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K9Ro6h+KdOPOq8ruh1eg7KDs/CVaPK1EiUtguwNBzxihYYPnxjZe/K7QSPjyF2df4uAsCr18MjOE6PIRVLkpAQwJGyXak24p4Uf/gmNpF3znN5Z4fYlEdP4VdYCswNScsyAguysZqmP10E5WDNc8JhjsUBDz5E9ZtCQ28+q8tPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZc7M6pH; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZc7M6pH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso1538194a12.0;
        Thu, 22 Aug 2024 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724353054; x=1724957854; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MtjKYRE04dmrNbD8z0rKJLoeLdrXZteqgEAdH8eTdRk=;
        b=JZc7M6pH8ucFDZfZ01VEk9SRnjkVvvHd/6A7orkBUJJUF09inKLD3gb0m8pVeCbp0k
         jmVzKzf7p31lvb2Q/ZXUaC2tiOBo7xCoNiSQnTcQDTwrGHPLj/704Qt4VzLoMd+0g55r
         Hdqu3z0bM/pqbyK8vS7UTGByGm6oE+qCZPInW5Cbt5afwQFJiXP5iJB0DbNnLJl7SpGu
         h7voqRuEa6cMlX/5u2lVcXxF0bJEkfSwLkpzOwE4XXpGZwBs0fo0/6MkZQRIq3qoMZLr
         PsxMW0qs33D83C/u4trfRQ4J/lB2GtpkkJWJ6VZVClkIo9HmbYG7FxeZ43ZxlLbLqxUj
         /S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724353054; x=1724957854;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtjKYRE04dmrNbD8z0rKJLoeLdrXZteqgEAdH8eTdRk=;
        b=bWhV2ZtXSO7W9mwp6w0I4IQqtQmfkCp7uGO7RSg6a/Rg0yOwToIlI49+B5gDxa9Qcx
         PbOdWldq+zY9eBaiIzeZuO5B3GBF3UxqSJ4ZDL6t0p9KeqKaaBlp3A6Jm3XG1JLIZvxF
         MOJNeQejV8KVLTF1/C0/AbsavjdGle+Sfs1zAChlfFIfz5fZxaL8RtL6jr838/WRnKZr
         6gYcLl6E5PKfg4IYrOhbh8GNco4CCvW2lghYG79PAx69pwKfIC4I/Ybp/F56y7sb6Byn
         1aajXT+pXVs+bjavtJjSr9Jee/8rvGOcP3NlDjNfRbVXAYnu0Sta878ryfZEXse21rwb
         avdQ==
X-Forwarded-Encrypted: i=1; AJvYcCURHcgJ9HQAKmuNGNEcQiWvCSqVblP5AlDAt3XAWcHx1PNyd2LmqPO7dEshxE7AzIa+7e5/oUm7V0vl@vger.kernel.org, AJvYcCUYrUALhdMKZdAfs8lqFezb9ntZh6cGoFHsX9ftcaYWA8+zop8kM+2OGJZsOrB8QZb2sYiHGlqPbneUMH94@vger.kernel.org, AJvYcCWIBFvsQ24Kt5sDmHlZEL6ll9s7WlTY9yrtdouE5T0NUPXe6tLItV6cVU39dCMaqLawoBQtpoga/v45@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06kDzCyfVOhbYCtkGLstPweCKEAnorl+dWkrVp4+kd+dZiMvD
	nmdJVtKSoCNmpacq+zTFjaFwB9nWBDOXdG8blkEC3e+dxu8lmiHTSEncxiSP
X-Google-Smtp-Source: AGHT+IFSXExqIY1d7ZDIvEQKRpCPVenAUTCZmIgIh7f3DgNDzGl5zRQcDHY2vDq+bOUu4VtHJqyrRQ==
X-Received: by 2002:a05:6402:5205:b0:5bf:1440:fc95 with SMTP id 4fb4d7f45d1cf-5bf1f15f927mr4405688a12.19.1724353053291;
        Thu, 22 Aug 2024 11:57:33 -0700 (PDT)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a91afsm1197218a12.93.2024.08.22.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:57:32 -0700 (PDT)
Message-ID: <2e4d3d180f535e57d9cb98e7bac1d14b51ffc5d4.camel@gmail.com>
Subject: Re: [PATCH v3 0/3] dpum clock support for Exynos Auto v9 SoC
From: David Virag <virag.david003@gmail.com>
To: Kwanghoon Son <k.son@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, Tomasz Figa
 <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 22 Aug 2024 20:59:10 +0200
In-Reply-To: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
References: 
	<CGME20240809115500epcas1p44cb69cea78a73833de38eab552b204fc@epcas1p4.samsung.com>
	 <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kwanghoon,

On Fri, 2024-08-09 at 20:54 +0900, Kwanghoon Son wrote:
> DPUM (Display Processing Unit Main) is main dpu for Exynosautov9.
> =C2=A0=C2=A0=C2=A0=20
> This patches enable clock for dpum, sysmmu(iommu).
>=20
> I tested using sysmmu, DPP, DECON, DP on sdk board (modetest works).

Does this mean you are working on mainline drivers for these?

If you don't mind me asking, what state are these in?
Is DSIM being worked on?

I am asking these, because I am also working on some drivers for DPP,
DECON, and DSIM on the Exynos7885.

Now, my DPP and DECON drivers are not even close to complete, they just
have the bare minimum for output and vsync, using them as initialized
by the bootloader, but I do have a semi-functional DSIM driver (well,
existing mainline DSIM driver patched up to work on 7885) that is
enough for controlling the DSI panel attached to my phone.

If you are working on DPP and DECON drivers, I won't spend much time
with those for now, as your driver for ExynosAutoV9 may help a lot with
7885 as well.

If you are not working on a DSIM driver, I'll keep working on it for
7885. If you are, I'll have to think about how to move forward.

Best regards,
David
