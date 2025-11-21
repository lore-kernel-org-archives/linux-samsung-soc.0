Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D2A233711
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714820; cv=none; b=JFivh9Ia0TJwGm7+BwoDLX8KnuW+r5IwfGCUlPhRTYsOXziR4oZzYXXtGNmEa02umHLAVmW58tx2JtrvsPpql2y6l6C0PkBKqa15YuCvrew2edDYRfxCrR/r+x2YMe1v1oRpMAjr2CxCH0NWnatSG7xKHuwYkMJVpBwLjBshD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714820; c=relaxed/simple;
	bh=Flir5tljPSjxxK6yY84qRrxreOuDD4ZmYqr0Soj0ZNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQoG6htgA4d0QHYMdAocUtKbhQfrzraYKasyb2djyDRYDlUofp8ICYgSGj1avE9Oxf0izdKDHSyDR7dwxlHVNXo/7vNOamh/gg9rhGb0j2pSurEpznxid5ZKD08OZBPDmUsCigpYRJrNAHjz7AZ/tnhRhUZ2xatuUa+eyywbvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPeS3YxE; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPeS3YxE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3410c86070dso1400611a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763714818; x=1764319618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rw6P3vTkq9/VDf2BdRM52eT1wyytd0Ws0h+4Sg6bhM=;
        b=WPeS3YxEXJ8DCbQxogXI5+2NOSlk3/KaChIUQkOBrCcRqwl80cF/c2Iw8T6qmN4yV1
         p92rpndEv4Tp81wPvy1vSJ2nQR7zkQ7Ie6rHYOqiYzn9K/J08ZKZWmcQRLqBZlyTdt3C
         bDUVIGU3nA4/pezXAOUaRBhQN2VGDPW3LbAuLJyw2SksVgcikqXVhzmnm0SolIYVPBju
         C1NrMM9hLAfHFa54pdEUdCWGBTAIEcfL5Y4QwqT/iCEgIfWpv/jEccMTfhRI1fJGXZwi
         SYaVwmGeIDPzbIH+QbaAPrNr114Zk9ZWPRkxQnRfsPighUVFeTzaId97/6yZRvYqJwi/
         EH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714818; x=1764319618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rw6P3vTkq9/VDf2BdRM52eT1wyytd0Ws0h+4Sg6bhM=;
        b=AV+aRZkyO1pZd52X6Sou7S9Jtt5Wlj17Wapl+2cSnfvtPtQGtOCkP6O6O+q8k2PHyz
         N+V6ZyCfR1Q8BAlkWaX6jmFC3ONYC4qADkMXvsA4fTmtax5g18cc6oaGknWXLpzSL8Mx
         rSnlJz6YQcfIDZZyXOE76TeQwLnyFEQPq7J12WafG0X8KuJrp3y36+Q3qOVm9E6YJ2oQ
         4wCbYrrnWTUA4kRUNPLLBEM+ixm+9fdBW5LVi0IJ29G4uMc/5kZNBOuI+gODetWAux73
         ndf/TAZI0BkywCg1I9jInuJEAfrIbixL9fpmH4DHNGR+shkB2N57e6Se+Ox1bpRZKSS8
         Yt1w==
X-Forwarded-Encrypted: i=1; AJvYcCU8ymMdG/Au8V6ZzEoHNaO/WTFp7EqbH9PdegrMzVFcdyt8MU0CgrYmf8l4tixSn/U5rEV7CpKF6CKjUVs5oEUcBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTJRdQChl/upO2oHJOHEIyo4gsE/XGmssl85xD2BFyxp2Kd+T
	RJc/CQCjSFKyhFdedCi3nlottptubmLf/mym3IBVnVOaKzUiy0vNJUFFTgiixEH9LYb/9Vc2/Rq
	9HQIi23N04yWdTcxTXcCS9ZEIkUo928DtGOkMGDnY
X-Gm-Gg: ASbGnctxeH6LXvQz7kZcsBOQ9teJ8EsJP1fd0B7LouurXvzjrGwknH1tPSLiddVyarH
	aRYqS/TeKs8qEnop+VZCVkv9Fr8kvHZ8mwnBCUjt8p9W/B13hozLqklhZU7ETO8yJY5A6PPRtPj
	2gD9QBCiX7PrMW7FnOfzb/tSKv6HpMrXnxzuaZh9S37blefOd+yuaH354OpnWxeHx6mabY9UDXu
	d2tQlZ8gb8GT/w8AvU2sgJYArXli3eCrxwjCMchrEDW3gPoKpRvwNfOcWuSe4kw0jbc4r0=
X-Google-Smtp-Source: AGHT+IEGKK1JVapl4Bfkn+X1caSvW4BJYyhUwjXrKD36ojgbUTuY+cLlAhIn+4hGtsKsgQZA7TevAUxQK94FOcafFjQ=
X-Received: by 2002:a05:7022:ea46:10b0:119:e569:f26c with SMTP id
 a92af1059eb24-11c9d819c4amr549173c88.21.1763714817986; Fri, 21 Nov 2025
 00:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com> <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
 <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
In-Reply-To: <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
From: Roy Luo <royluo@google.com>
Date: Fri, 21 Nov 2025 16:46:21 +0800
X-Gm-Features: AWmQ_bmUVOlmJqcVyT_EtvB6gdvlOG5rtdefUR1SndkOE8ikDuOVfBKFFoK6hGc
Message-ID: <CA+zupgxskC2HMy_sLusDbb_L1t49frjLQW6isBfAKa6BgNvpNQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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

On Fri, Nov 21, 2025 at 4:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Nov 20, 2025 at 05:36:41PM +0000, Roy Luo wrote:
>
> I read last discussion and patch is fine, except one issue in example I
> never noticed before (see at the end), which I want to fix. Apologies
> for not bringing it up anytime earlier, I missed it. While at it also
> one more nit.
>
> > +description: |
>
> nit: drop |, do not need '|' unless you need to preserve formatting.
>
> > +  Describes the USB PHY interfaces integrated with the DWC3 USB contro=
ller on
> > +  Google Tensor SoCs, starting with the G5 generation (laguna).
> > +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.=
0 PHY IP
> > +  and USB3.2/DisplayPort combo PHY IP.
>
> ...
>
> > > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb_phy: usb_phy@c410000 {
>
> node name: usb-phy, because there are no underscors used anywhere in
> upstream. While at it, you can drop the label as well, because it is not
> uised, so just usb-phy@..... {
>
> Please send new version with these two fixed and:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof
>

Thank you for the review, I appreciate it!
Ack on both points and will send out a new version.

Regards,
Roy Luo
