Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76F1DC9B8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464719; cv=none; b=D9BNT8nvUFJfxotb28bEIme0ZDCJfj/iHwW5oHpWWdwlyxDciRlieFZs7JHV/j3dDhZQ3Z1wI9XJSNDC14VcE59RxgRzj4U3Q6QuN4MyuiCTb/BmHGx4LNmgBIFaTwYBCUHJt82EQEfmY/3FFiYr/95Jjp/E97aN1aqYkPxkzhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464719; c=relaxed/simple;
	bh=PDj01Ad9D9384LS+xvtl+DCVQ9dzZ7KWEvAu3iSEBxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbsrTB5Ac6h4LX1/ldCpxvkiN/dF6JVV7zXZbdYxnUH5qJLhWyrMIIKj2gIWijsCJhJ4EzY6YbMLrf/FiF3dN73Z5i9IlQI5RSCDv1oyVzmds3Btsd0f59trAHxylsIgT3Bu/6RiVlZ7jpTgpBHJelmAWyWTBaEO5pMaZVyEqdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rf27NY1z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rf27NY1z"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5269666e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743464715; x=1744069515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e04/jOZEpgcg6Qfa0s1PaOutVdlD0Cl29sqV9y8ymK4=;
        b=Rf27NY1zYJP+8THrLrEUzImw5sWzwsiOYrvg8zPWfeW1p7DTbIfg9fnJT4uh8lFqjx
         +M7ZA5o8B+QbuklLVZjDsNbMD2hByRdmSSYcAUcSn2g9frZDAcIVhncaaybv+ClHVNLC
         Zx4CUYKHvq0yFfaHiUqieKOYYmidzwUDHy7d6iQmuwNnIDzCtC09fuUVgs7iSXiXgRkJ
         mEFIvYyT4dfRC8whLtISmwVcWpk8c00alolz+pDFLtr//BDBVT2tfGiXGdZwxIjxzm68
         Cttls58FZhk53QFIbMN4WQQqTM087Su/byUUqsP4uMjb22IdfULK25b85DjfccrNCJ8l
         cy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464715; x=1744069515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e04/jOZEpgcg6Qfa0s1PaOutVdlD0Cl29sqV9y8ymK4=;
        b=cF+V73llXQ8OS+4mpYkktOiiR8jcv1URDC0Baut5dk55uTLEnZjW5hK/Cs3h/eRPr5
         PH594l4VZqIJc9w/xOlYXRI9vsBUrv3Toj3jVSc0P+jjXJPe/AdtqiBLLZsCIXHTmu6H
         +ExqBpCbm84o/Jueehtipx5Pi4yBbR/2PmqpYpx9XE3QUrbTompVQ/MMoQqpqbwOwup5
         KJqWOywc5eLCDb/O4IGartq5/AAL/ITnA9TY225w0QeZnHbDssXuvHd4rix35OMe/Ueb
         PKaUToHq1GwMWAbWnXZwgBAqxSNUfgLRVM9XsEIutcESOjaH9xYPjQ0yvsXR7Y8+p8t2
         qJjg==
X-Forwarded-Encrypted: i=1; AJvYcCVUD+P6B3Ubs/DUKObG4SeuX5lbApbnEPN4hSfx18kNyznqQFx0Q290RtSa+nXxVLDFuOMhZSbxWfRp/PkcOuIP5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPTi1g+3gHZC9yZ0hiSATVIOjtfhXTWgNBwQwdPG4FFCOc3dJ
	bbwknGDfSegp7ZBLVwL70id2Pns6MyQznZQV1hICYOYp5dPB50hghcTWNIwuQX7caw7TgLVHA4F
	ZbZt1rckWbIWaikAUaa9yA6qZVUdZEHqzuxM=
X-Gm-Gg: ASbGnctYtfWKhsm2kVznQyCXs1cFgaTOr5M4RPGYQaik9Hjaxp+Y5EZS+QmcMlUoC48
	m5L6euZqDGaElyFHS6IMkauy3UaKekxcVLTpo8Y/QxZYtsnYyXfree22cE7D7SkEcEE58nW4Ydf
	Mx05CIXoPuyZ8OKOHm4e5ZUse/RLj+uj1pHmqBNTE+0NaABS1H+7h3qFI=
X-Google-Smtp-Source: AGHT+IGKxk3GQ1L9qdBB81JDCx4Bq2Dj2b06TXN+b9tb6Ea14RgDQquGhJcn7FWqUTKnzxE9oIWAc1dXzRqRgDpEaRk=
X-Received: by 2002:a05:6512:3087:b0:545:532:fd2f with SMTP id
 2adb3069b0e04-54b10dc4647mr3518759e87.12.1743464714691; Mon, 31 Mar 2025
 16:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com> <20250331230034.806124-4-willmcvicker@google.com>
In-Reply-To: <20250331230034.806124-4-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 31 Mar 2025 16:45:02 -0700
X-Gm-Features: AQ5f1Jp34FTtnvs1g4RVHb7nLo-iWvkEtBdosqwvf4UXMVf7403MXs4PKlQvGmM
Message-ID: <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:00=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> The MCT local timers can be used as a per-cpu event timer. To prevent

Can be used, or are used?  If it's an option, is this change important
in both cases?

> the timer interrupts from migrating to other CPUs, set the flag
> IRQF_PERCPU.

Might be work expanding this a bit to clarify why the interrupts
migrating to other cpus is undesired.

> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267f=
ad19f093bac979ca78309483e9eb3a8d16]
> Signed-off-by: Will McVicker <willmcvicker@google.com>

thanks!
-john
