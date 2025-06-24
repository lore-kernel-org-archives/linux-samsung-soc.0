Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D8B170826
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792200; cv=none; b=Dr2go8Bbm/5/Safvr0wVaS+LfYSKyEay6ZIcH00z7vv7+n88R78EuaphGCyloq2e46t4Y1vXLPv1r8c64/ksTCFdcwVLUDNgGYg/LDQDyuUoxccHrqsWzOaPzXMHI1mnO+pfZ/wIE1B2kJkaCyGDA7os82i4GnSXMISlfKTqVmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792200; c=relaxed/simple;
	bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMrQKHEAgM9FJwZ7ksG6IBjqw1Xl6mHZJO5uiGAQsAdhBU6Kdtri19jmPHB68IT4hks0Uu77rkcrWU17J7/dzDyjNNM3iOYlzo5QHnSRfm6Q3W8W8riI3tqMn4uABZzJo25WYxTMBU/0vxPH15LseixtVMiy6L31W1CPNztW6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjcTzL41; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjcTzL41"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso8461211fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792197; x=1751396997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=ZjcTzL41jB/kZUDeGngOmfr8licR23+YP+SfM3Ys+9kcbEEP6bc2tIjj+s6116mnmU
         RuDni2ms8BfQWXYh6dftypJB1I+IQqRs+x/KSVFaEe1OMt1Stmaefr0U53JT10HdA80n
         uGIMoJew8TEQ/GGvEOnmE34ZUsYKd20dbQDCQehcpqDrDx5gec4hyUNyELwBb54yVIHf
         CtOJtdHax65go4A9Iq5I39SMIG/WJQ8ycHbYBxg0/yakDw6WevKP48ZHE6VI5udjlTGz
         mm71jxAMk0Ag74PY1wlTUTsVzXxEd6QtPF2978R1o8G6CDSBHCm4tbpVDh+v7ni9Mqsg
         R5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792197; x=1751396997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=v5yyKDko6I8nkK4QA8x4hYTfJVMnSDGiQvyG0tVNK//Cg9RZGK7EAymvLhlelAbwT5
         PiOEmUnHvemkyG2Fca1draPGAQmK8xLzH7EVHJDRyp6pmtHExMOxdatwGmZHcgtA6rZP
         HUYsmldAuaK/b11IvocrWP5FEirXqYAxbZ3OtdrKh3MLHIlleD6litViOPsAI/ksZFar
         BPzsMQE9x9EQBPp44m7N5rsciATvQkZbUsXtG+2GFZW2tM4qidFlKd2jWu7PyQ2bneRM
         kmJx7Z4gR1AANlmvOR7yR07jgqYQG/e7rh7pAjMZxHsjv5k1v/V9qCYOQXtsBiL88A0m
         BSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6qcq6EaMWoMF916Tbop1ELnO9KNrZt59keRW5hw29sVutRlUbq6RTS/AuleSgfmD0Yxfb9UIahgP0XsC3mazkfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DOj4wkq9QyKVscIkBvMskRsj8N0QY9tBRtAF8bVwqACba4Jh
	nPYAfO5EEsbOM3s/eBjALwajsuYiDw6zEsFWzp1nGwLBQqYdYywPM0xCM4IR19AxHET5b1zsdEs
	HluWoN31ELgmGax6D5GyOvwS+JuR0n3ev4JVhLhXpwA==
X-Gm-Gg: ASbGncsy+zYB1pvwWuWtqkuFTNAipFKjJTQrz5+KEgXqtVlYzD40c0oKs3f481rUS+A
	jeauGd1B+iOv6YkdNIa4Ai9dvVBqmW9TJSIoJIq03bKDRFYMeAJT4bBgfhUvHJ1lwL9Dbh/oIqi
	TVrucshYHYc9FWQqLvXMNZyi5x7sPWNdUhlPfw72+q4ss=
X-Google-Smtp-Source: AGHT+IFYV5tWfAirZ3xGznpIUaLpWBixuh3VvEydLIyjUMUfbNZ+cH8IGpZnstfzUOBltBpSOosISbHrdrVWXJsPv9I=
X-Received: by 2002:a05:651c:4181:b0:32b:8e4a:5710 with SMTP id
 38308e7fff4ca-32b9906d535mr47675041fa.34.1750792197208; Tue, 24 Jun 2025
 12:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:09:46 +0200
X-Gm-Features: AX0GCFugxTy5C8vSywb43SRY5CIYHYmTk1VMWuSas72eq14vY73ndiufDbScINw
Message-ID: <CACRpkdac0sg82LFV-Ub1Wnbpq2jTWgAVXZzCdTqLakV_4GkFbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK registers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:18=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 =
to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it ha=
s
> 3 EINT_WAKEUP_MASK registers

Looks all right to me, I expect Krzysztof to review and queue this and
send to me as a pull request.

Yours,
Linus Walleij
