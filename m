Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E782209679
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jan 2025 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884600; cv=none; b=nf1RQwvWjw6+ZYnOuMZRUqYEG3rIzDn6dYHoVZhX1jHwUBg9E5OEiSHcbUdHsg8RjM5HjDE/G+abD2EDr1Nv5sgq1rVf29F7B4lE+6Q11cVT/gkqvz/520Mx4i6AhsE040p/3p7zmoTOQx3WfDIsrZvst/WtEv1ja8wWev6HT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884600; c=relaxed/simple;
	bh=y/+EmGDA9oQh65FkQDBWgjTtUb9Q8LO/NWhu/sSSR2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y7k32IcQ9LbMXeQgcK1HDXAvjVbaM3m86aVS3LDv3/yZbo11uIqmpJdizq6f87+ugmzjkDHR/U//zX52gltmhYkaNotvS4FdkVEb/m/o8VouCXNYINEfZ0BJ8WUCEN2gKycWyvejDFjlMWnKuvzm5prs6YJkXbhSBs1+K/TtA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lwbg7obx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lwbg7obx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361c705434so42564405e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jan 2025 11:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884597; x=1737489397; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OmWlR4cF+mPlvD/SKofAb59V+xFfrfDkiiQN2ULLVu8=;
        b=Lwbg7obx6A9/bESQudinRz6qKVK+DOZJokUjGSNHcw6pSbb1XKY9YxyJH9+y+XOvHB
         JBzEEKp9jHf5xz12via0CbnxZ/3qWmS26D6g7KrZ+xle1sES4bPHKk1znJourdMeHZJg
         5ypWAT6BVB4447KtyueqA1trXRfhWYMFbg+anGv6GyBwhaF1bIq75dbBcx33ROfMzhOW
         OIVOIyJMQtSLt+8aTS0HJ3XWW5ByAkc5dGb6/fqAl4r6ow7ri2JQ1wqGhOzMLoOaAih7
         DQW6cE0y76hJ/3yoy/4thiqSq3bs2PG5OlZiXz8m6LlE5s578LSqKJ/wjAux+5p+YIfz
         vScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884597; x=1737489397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmWlR4cF+mPlvD/SKofAb59V+xFfrfDkiiQN2ULLVu8=;
        b=s+UCcwY13+Y9IfQjZ/WKYAVKcKx5QEmoQAs/n4qaLUzAXee3A76j25K1lxfiqTMVAi
         lDYkc7UdQ6QLz2fQo4TopiwTeDVoN7bQplQd2RS1RjIl6spSStZQMXDXcq1Uew4WlyNA
         5Ll/3WHfwP19vd3WKXBXSZgM8Kc2zNqjU4/rGXggSUeGILOdYVflKgDalWS8YcncF6AM
         5Cb9t93XQYvuS7GM+0Xnqv7g8dJDHjExrwznZLsZci2hDUwRccTZJJHZj97N/XU0pqjn
         vVz21TGdjgEVr88GlZf6v0ZBBI2zPCSKUc8VaKzST3tEoyv9LMkPNqtNB8HgeWS8RPw+
         0zLA==
X-Forwarded-Encrypted: i=1; AJvYcCV/a2uWXTF55sLpLXdv4qEvyrHeTfsia9PC4IFoNYvnYYg7t3wLn5eo0lMqeP2pj2VWwKI5V0LWzhrtxwvHtusJwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ySkAVZZRksREZTyG8TM9t6B7WPyvMK/PGzUieVUVswmj/Vjx
	VI7K20Hck6PhKaCEso/IDXAG/DXdOMAghA9TlvEo+kg/rxPYzQYTR8nx6A8NYzc=
X-Gm-Gg: ASbGncsXoamaADTALLmbrbsKS0pMfQPZbdPTZEkI3lu2Bk707HQGrBaFErxCG8/Yl+J
	kuQJSEAzWehYW/9r9yvNCNIj6trH+y73fJWW/Db2+u1B9hTXiP3L3GKkdoKHG5J70A44hJV3oTJ
	JsGEMNdtb4eWqoTUneCKKMP17fVTgEfLtMIqNHjm1Kdh7akwE+X0Vuk0oA94UZrul65C/rSlckP
	7f3stbDWeZhebpM2lV3p1Z4+MFzd0V9PW1vU42SGXVrQuhEP/lRa1x8htv9
X-Google-Smtp-Source: AGHT+IGQouXUOO+qEb5G2vSRcAAdIKYNRk9bOvvSttjkX7QyY7z4FXFdlG3d/Ksq2SBLmY2mxOAH8w==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr22826797f8f.10.1736884597362;
        Tue, 14 Jan 2025 11:56:37 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5275313f8f.43.2025.01.14.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:56:36 -0800 (PST)
Message-ID: <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Tue, 14 Jan 2025 19:56:35 +0000
In-Reply-To: <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
	 <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bart,

On Tue, 2025-01-14 at 09:55 -0800, Bart Van Assche wrote:
> On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
> > +/**
> > + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host and
> > + *				=C2=A0=C2=A0 thereby the Host Bus Adapter (HBA)
> > + * @host: pointer to SCSI host
> > + */
> > +static void ufshcd_scsi_host_put_callback(void *host)
> > +{
> > +	scsi_host_put(host);
> > +}
>=20
> Please rename ufshcd_scsi_host_put_callback() such that the function=20
> name makes clear when this function is called instead of what the=20
> function does.

Would you have a suggestion for such a name? Something like
ufshcd_driver_release_action()?

Unless I'm misunderstanding you, I believe most drivers use
a function name that says what the function does, e.g.
dell_wmi_ddv_debugfs_remove (just as a completely random
example out of many).

If going by when it is called and if applying this principle
throughout ufshcd, then there can only ever be one such
function in ufshcd, as all devm_add_action() callback actions
happen at driver release, which surely isn't what you mean.

You probably meant something different?

Cheers,
Andre'

