Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FAAEADC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156663; cv=none; b=gEjqkXI9z1G5mNoyIccqZe0W/pKmRb/uB2Rzt6YogfeElgoyffheSLioo1Kx1V8/ioZWBbq5h7bDrEe7lzgSG1G5nhEZJr1/plknvi4UPvdDj8H7zMeB/KT+zQWokJTk8m+inFfl8LiPmeTuFUhOWZBmhpzwahnTCY/j+Cfn6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156663; c=relaxed/simple;
	bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKsdnJ7UzLfMo7M2PlH8H4cJ7wf5jwofQUyg7WY+Ct58LcN+7+jKRfswotVjL0GXlM0XkVMZ3VKUq3TxxegfqI7ea/K4BDHNNGAG1FDCKg5cXWg46J7PBk7YZAzQ27MNSIaDvIT6ciOqtoj3NU5+TcjBJm50pdjcPi6adpP6AIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfnrMmva; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfnrMmva"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60b8a9be8a3so546628eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156661; x=1748761461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=gfnrMmva1AipO0tjHq7eaLh35PQMNDlu3LoWMoQs0ftHIkgXZULEaBufCfVEMyiot2
         vnRf78FHTJEBYGO0/KZw7MN/bgaVlfN8YopbWklrHBHHxC6PDcqu/Kzg3GWgZgsfQs0s
         TbyRrPt7QaDJL9JC7XrgXzXVmqmCPVITEgwhmyQEF2h428wQQZnImZGInoU8NAyaU/Cx
         9FS/Skg1yF2vnJszXgupqU5ErZvks6wpvaKF6kV5lx18J/CTJ8fkwWdzKF+AIdevCPcl
         7e7u03x1KPfDhvKM+o2V7n+DBZcKRelkHKuz3VxzH9JMXcmkN06dCl5H8Ct7oT79FrLD
         RBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156661; x=1748761461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=eZbi5j03lGJG60PUg0AfgIdDlinP8pZq6mNV1ql4n7SdomvVKB2zuGxwcVqpLxcl8h
         qTOwPV7jM+GR+HA6aFn/veX3+l5qOQ9rr+ZIy79WhP/s8JU8RmmUdr3O8URxPU4dS4hj
         qcLchJjPVEE/FUWX7nt1JpQkkwwyVCfNVYgqanWHV8kShYgljmIcsQM77AzW31tkVAqk
         Vf6H0Q3RKIz4/ZTuEBYCulvWzQU6EoxnqW+npGglsiDBVFbyG/LdMUJEKwAgIzDN0N8y
         fr+Xvjk+OsuyetibBIDp0aB/xSpnuh6g1l9K3XPbOyFjmXHXrfjn7Qs6vdmHSchvBAwy
         Bytg==
X-Forwarded-Encrypted: i=1; AJvYcCUNOqrUaKNigSD9X2c7EapBDTdH04lPBBgsB+4aRy3+HUIob6/p+ymdT029lmwE8OUgPms4BrTKjV4Luvx+hNuKwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNaH7voT5MWaofbxJExbm4QsH+tGOlWPW0mvq+j5wEfWSkvtm
	0z5Wq+qCtK3ij1S0oUNf2MuDmqulfdA6GfSoa1kG9Um22KS4HkobEMK2kRr06ltPmJNyqnfCUAB
	7MCN8FCMtTQVqhuC62RHBzzwOv49+A55ZHZCvSmQ5JA==
X-Gm-Gg: ASbGncuBGa94CoCepd/GYckk3dv9qr33ZrMvPTosmwYScwpvtUk+2/2LayrS/bFMSus
	A8jiRshLIb9inmNKi05kyKvz5t4L4Tmu2Td+mg8/2z0RF351ALsq4zAWp7YNMCoYpTgM0ACd+7t
	42jHHOAEkAgxzrYpcYCW6CFDqMSRwCELqOakQ4Src9Hb31X/MJWx95PwlYZ/KA5QjLIA==
X-Google-Smtp-Source: AGHT+IEobv1MmUdm3OhF2+QlgOMO6v4WRzce7p+hyeEZuMdsOou9ZkqZae4dTJbR6DrzynyTOeJDFtFyhDMmxSAEcOs=
X-Received: by 2002:a05:6820:138c:b0:60b:a44c:e987 with SMTP id
 006d021491bc7-60ba44cee17mr2124135eaf.2.1748156661280; Sun, 25 May 2025
 00:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:04:10 +0100
X-Gm-Features: AX0GCFszlaYSVG9g4VM6bmqpxuLkf0fqSSgw3AbEnkb0rK3QTfE_tt5gub6lw4o
Message-ID: <CADrjBPrvr3F+A-MVAB+BLriy5orCGvBJmqrw0LGo_BaRpQ2YRw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: add dm-verity-device-corrupted
 syscon-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On gs101, the boot mode is stored both in a syscon register, and in
> nvmem.
>
> Add the dm-verity-device-corrupted reboot mode to the syscon-reboot-
> based boot mode as well, as both (nvmem & syscon) modes should be in
> sync.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
