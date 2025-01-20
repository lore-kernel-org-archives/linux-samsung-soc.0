Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6FD36D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365491; cv=none; b=cvgU8pec/Q/HAbdsYOuHKmegCwCBrbE3vvE9/mySK/6gnzB8YA52BnXmu6FG+k2xXVN66lYICoxtdFfWoOOg4ESE/VQEJRgQ8IRsr5XH0N0zOqm+lYq6BQbqRT3CZwFCukJtj4hxG5OgCFRBg5rAo58jTqkatt5MT5sDpQvkXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365491; c=relaxed/simple;
	bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnGxc5pCv6SbRqyU43JqyjAmzcioRR0UupE5yIxTJfz4JP9MB2zLOHvfV/RmqOn+9lHhY+TfwVnOjqHF3gmQ+d4SN5Z35JwWrIaJLnh5HQyKmtSd0x9YbGkkRl8k+v+FKKnwJCFX5zkSHcFWJVyzpP/Ee1QTeO1F9NTxpNnDlQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YRZ0aso8; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRZ0aso8"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f31f8f4062so2057773eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365489; x=1737970289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=;
        b=YRZ0aso8PuPrcUuteP1jN0b8K0ZyBSu18XhmK+hYkriGnwpcw78BJQ5/80UTASPk9t
         ocDcQc2W/+ngFDcaj9DnPxj+kxm1hiQEEVWWYzCjpesFqqKmQGOKwTt4Tl854Q3l8EPV
         2wMo74WC9+IobQOHfeRFfN073/hTiWIsyiweyk84mjIgRmMIwYsHyGARxySf199WGZsM
         aSlN0lqbxd9FXFjq3O+PxFbCpfCu47oZQuuJ7oywyannKmq8RGqCgcgiWTNwc5LRt0br
         rdohQNSCE4N8mOXfx0clDf9/+8eGf+XRpJM8mANTSutcElB1QaH6ut2esnRDOf8XN/Aq
         ScGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365489; x=1737970289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=;
        b=rcq1s3nabYs4A0Ni41+8qAGlPPnmAmYPcXWYCHTVfn8qQ/XMgVBhAJaj0IwlHAclPU
         o1ct9GF+dR17eQ5MEeC+LunQHr3Yby0/+IQ7WgHZGBSQVti7/SF21gxcBXbMyIoka5hd
         sqV2EdRwR2JWi/T/D/S3vx0+x9fGVg7vx0ESbCgLVtmpAds4tFeJEiwpdfjLOIbEi1nx
         UKyR9nu3CXHQxZzpT8867jKT5ZzahGtvQq+EQjlh7vP23SYB0415YqqQ+tHDFkNz3A4N
         Elvjk7ecTFvvyRaiiglL2Sv9oRn/gOQr33WyMuO8ZASAfVHHDcE2QmRI6/c1gh4r7+34
         FpAg==
X-Forwarded-Encrypted: i=1; AJvYcCXuINvDEwhqgFxRkX2smF5CHe87GoGjm4c2c9nbM3VWsAwkpbletaFmhx7lWtG9bC3Lg/TlWsZZb+7Nj9D1bHOARA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbSh7SN4hIfD4jDVfk0+9/MMLe3xWIREsxo3mBjtwPUmz15as
	TGv0B9ZyVxcTMq/lZBRxwxaDmbRSy3eAUtrQJIHkGprJiJDH2Q9O9HaIbU8fG8VUV9m5qaZ4Vop
	p6qYBdUaDOF74aodABisRw3kAOofQax/ElhxMUA==
X-Gm-Gg: ASbGnctX3NEu9X/TGd8aCoL5MeDw2/YOOKgjmSwS/ahdwbbA+frG2LfBqI9GvNdQKTk
	HIvZCxxcemaFIYR8x0cqPiwnuuoH4f1AHeVvzRxBb+HFInm3bD7c=
X-Google-Smtp-Source: AGHT+IF8len7DYYtDJAgNhF4OWjKUVOC4YIVlj3v0nrpLbI1QFEg8CYynCXmjD6obOo0TkU5UVshdOMsj5zP1TGy7io=
X-Received: by 2002:a05:6820:20f:b0:5f9:12bb:4e22 with SMTP id
 006d021491bc7-5fa388a4597mr6443440eaf.5.1737365488821; Mon, 20 Jan 2025
 01:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-4-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-4-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:31:17 +0000
X-Gm-Features: AbW1kva-M4BHCc_hAA9pu7iTT8qDuD1HyhFEle30Ny8cn6ziU_A-M8y799oFSCw
Message-ID: <CADrjBPr32JdfwMFWB=PB_jkXddqmq_4CDd9hqowW0tzbSXp5QA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: exynos: gs101-raven: add new board file
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Fri, 17 Jan 2025 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> (Oriole), this is also based around its Tensor gs101 SoC.
>
> For now, the relevant difference here is the display resolution:
> 1440 x 3120 instead of 1080 x 2400.
>
> Create a new board file to reflect this difference.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
