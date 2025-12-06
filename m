Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3AB1DFE26
	for <linux-samsung-soc@vger.kernel.org>; Sat,  6 Dec 2025 02:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764989111; cv=none; b=rN9zTnXzWRNeNw2pNHkrNsuCgkN/tNkBBxUKYoHDQjiJLgl9Rf+okrYC/66qeSpj6TLrOdFrryNXE7njJzYO2OzEnSSfPk2q6A+697QYNHDFLmj/8ePOwGG1J4P2wQBmQ2wtNYJPbniSXwFwE9qMF66HPggIbAcpFwk2/B96hfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764989111; c=relaxed/simple;
	bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6OUAt0S59t3nA3RMUD6wEpoty0xgTmBIG4o5iY0Vj97pYtHjYvQ27nwt362gHyoJHwWg8iAu/NMqGjdyiSOMCPXDpcY0gO+GbryT+UARt08Ljcpy4BEH1MNd3EMtRkRpvb+q7ICxZzz6FY0ItfuS+0OYWrAL8s9d6xZMggWgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LDKFsi35; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LDKFsi35"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-295548467c7so34637785ad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2025 18:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764989109; x=1765593909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=;
        b=LDKFsi354jaA8Opxtec0gdePgn4jOb7NPZgprTg9lUBRKM8LTQjkiI01spszXJpYZQ
         hG19LGALt320Z68g+t+eZnogbgurKUCoEMEmZ5dSWJCisXnDuvHUAIx4ylEiGgunTiKA
         kJqC76tuURQw046y/6TIiBKrHunGUZ5R99sg1TO45oS7MOFTYpJia752AXm/mlmffaaE
         c5t3Cjnfj6CqugQ/qBmcSO/gpKhiCR5y4hivCAbI4qHl9nJ7c2vbHaidw95RRttEdibD
         I/sImWQQ0VEPiO08wl8XcOzKx6XPT5t+olsySAdHKU1+zTGABv/UxJ0AhrOAKagC2qDc
         b9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764989109; x=1765593909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=;
        b=Wu1DkdxSvcBff541uAouvGgBOhkTfNrUC5TODgucXgRivnmHdXgr/FNgBS+BXz3ltI
         ekGImhZLaG8y3T5hEVB6UPxnpX8EizZ8/qzDg1beAqZOdxP0r3JcxEmVwkcsaIYQXi3K
         F0RN3CHk/Ldi++mJ/48VNiU67BUnFTOPh5NFJHlSyjzm4+m53wMTC14w3hvnc2myL7Yh
         WNYZUYRK/GARnSsTFrA90KoQt0dTFWOuZbqK8JUpAU5YDIEuMwDMkLV0ihJIEc5kq1DW
         xyVz/6vYnAhsCKg7KJYLiP38sQxbKdQ+/yXhaTSsCpfBlsvTUwpxujvlDX/Zh6WpNL5W
         belA==
X-Forwarded-Encrypted: i=1; AJvYcCXsVTO5NNHSea+Y1HLDdtvEZm8LAyWodC78kVSSynz+LnhDVkZbSYPmL7pHfElTKgk+SRPfWxkHxjaxizvDno/Nqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZx/wNbDXGVJrRfUId3Jzp1UiH5LJDH5t1P6uDGpz1YHPThLH
	7Z+h48jqu5WjfzJCl8hNJwOF54FQCOTjBL2ltK0WncCrwrBbTjytZgcdOW9zOksR9slGJjUbPuK
	J2JQ4z28oFsOSIQsL97tjwLEv2bYd6Fk2n/I5bS62
X-Gm-Gg: ASbGncvRM/ItznzfCuaguLfon6EEYbSaMZETJdciv/hciQOD+FG2IECfTRtYDipdlGA
	DxXCSw+FGPwndytKOsJ7J9C2xvPNOEVQF4HFlNur3mf4MWPdKXoy8hDl60H8ChfgDvW2BL2ztvw
	7nlA/eIjMiiloO9zWJUylbnhsGrqhgxax+SCHMNuoy+09gPZ5SJllQzGWDOOlnaH8MBG73dZfMR
	sygGkhbgaUVbiOIs0e/bT66v+0Qjm83c7TRoouVkavuAxtfu0kmt/LoKzAVNfYhazLuVlIVLGI6
	/Oz3o2h1QAwCU/GXuo08gzGelCk=
X-Google-Smtp-Source: AGHT+IFU1KYTSeq6FW6nQIMrzlj0NO5UvinjpD1M87pOOtWRqM4PAgvMxx7JqBY6yKTUwKBkDJhMObt3hsS9FZVHukg=
X-Received: by 2002:a05:7022:f415:b0:11b:9386:a3cd with SMTP id
 a92af1059eb24-11e032ed8fcmr1007941c88.46.1764989108309; Fri, 05 Dec 2025
 18:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org> <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
 <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org> <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
In-Reply-To: <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 18:44:31 -0800
X-Gm-Features: AWmQ_bmtS6VqNvSPWWqMA48yCBiebLPdL-OG-iJ2CapE017dl4OEKL60P358vSw
Message-ID: <CA+zupgy5TKWiVGwt5dFye7ztk7O_n7JQm4j7H8BCC2gzjfkgqw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 12:18=E2=80=AFPM Roy Luo <royluo@google.com> wrote:
>
> On Fri, Dec 5, 2025 at 11:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > I assume you understood what should be done instead in this patchset.
> > Anyway, my previous tag applies if there were no bindings changes, but =
I
> > wasted too much time here to care anymore. The expectation from big
> > companies is they do not ask community to coach on basic submission
> > process. It's quite unfair to my spare, personal time after work,
> > considering how much big company is making. Big company should invest i=
n
> > this coaching.
> >
> >
> > Best regards,
> > Krzysztof
>
> Thank you for the feedback. I understand your frustration, and I
> apologize for taking up your time. I will be sure to be more thorough
> in the future.
>
> Thanks,
> Roy Luo

To confirm my takeaway: for this patch, the changes I introduced
were not significant enough to remove your 'Reviewed-by' tag,
and I should have kept it. Moving forward, I will calibrate my
criteria for what changes are considered 'significant' (essentially
any changes to binding), and more importantly, always document
the rationale for dropping or keeping tags in the changelog when
I make non-trivial changes to patches.

I plan to send a new version for this patchset and the controller
patchset [1] next week with your tag re-added, please let me
know if you disagree.

[1] https://lore.kernel.org/linux-usb/20251205-controller-v9-0-9f158b18f979=
@google.com

Thanks,
Roy Luo
