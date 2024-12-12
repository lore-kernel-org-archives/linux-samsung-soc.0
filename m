Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398F211299
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999363; cv=none; b=L5lHA9mWqJ+NpMiu8EGlkopmHb7gnQTHP8j7Nk4ZFAaCU/6KrNYCiiZrCkW3UIICPd+jELqQ362aGjaUqx4R9mmz/gA8I6SM1GjIQ1YjuaZppMt+Oax7/zr2GXRajo19/csxmd6MuXe4U3kcK+g0tBaX3JYiVd1y/l5DLO8RQjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999363; c=relaxed/simple;
	bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/hdacE751AohTeML9Cgbj+zOdzNle2wPB79COMQW6QyM9iES96Apx0mvIj/l7BtkymFSxW1VGCHIApMdHCye1nm/yJL2cEh64o8QfOck8SlIDsqeXnIk6a/GchV6SE9Stdl0tcvXtnC9Suu2msnQjkxzqhwsgavQflYJCIjcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H/Q2HDH0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H/Q2HDH0"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540215984f0so458425e87.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 02:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733999358; x=1734604158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
        b=H/Q2HDH0HBRV2/sPhMvMxj4gsuUcP/qJGF/ao069FSpE5LbZa6RYcCYPYrMA0whE2T
         l4f+tQIRstzzOOC9RhBDkdOVICe8xtmjBS662el58OVjeLVsn6vSJL+nPaBVVVbQeLE6
         QIA57MHEjX8EAcQgISwtYEdc7WLCA4aL1oYWzvoyQWrob9356mb1Q8sWyy/BYZXFpD50
         w1P90OaFIo0VaKoBGQTzYNEaO7KLfgMAMJkClvZr8oMgjRbXEo+Ozg7xZYKkZtVFdlc/
         QWitARsK/YTmE0pS/vAXJBPZ/0bHwIxqOJt4k2eG5UlwabzbsvsgDaxUYaKtUjBzCitG
         VsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999358; x=1734604158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
        b=Vb6zFYHQfRcnTjHAeI6eVARJSpA7gbI9Ql5qH4jiNXKQ65mzDDkEvwIaPb2tC8E82M
         OItN//aFzBux1vnACkBqOOXH3MZzAmpY24ndTR/SfvP58XvpuT6ldDFN2RBvXkGAiWKs
         kniinmiBhZZzsByoJAL5JxcpjcK8ePMicKTOAgGYUGrkEC9mEHa8lbSpf1mGW8HmwEmM
         rrsPK5Vszuogi3V38EkV2FIQR741gvxxtLCYj33Gd0qPRbvvohGXgRfVha9gmnuBd+YX
         4DLNAbdJUKqzVPuokOHWo7haRyY9Br84+HdM89zpRgZ76yJQf0OkiU36d9McCE+OLzuy
         ZPGw==
X-Forwarded-Encrypted: i=1; AJvYcCXtvbqtGw7xDHwNkvL4g79/5qXrEH9YmbX2mP2uGDwbT7UJbr8MJ21VmQQCqunO483N3aE9/zFo/IXt5QdtW2GmHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMk1OAKgpqTb43eiDjLdvRDAsbxtfC7QPv+ZMw5kPLctARSrqZ
	4/eI/FrITape8miMUxkIOaaWK+eoBBW2+WD0WShm/b3i4I5Xwa8J4NSDIExzQ5VDn3yuN+Wl9tc
	1N+TcAIg8icc+c37SM3xJV037MIX98Uvs4jT/fA==
X-Gm-Gg: ASbGncvnGgKkokNu1JJFWX1U9aR6QhCKiMczMG3kviTIol0aBUarqYtAo9fNpATgqvF
	o6JsSQS70pvTqb+piuVZCB8mePBqgeBkMOVMT+Q==
X-Google-Smtp-Source: AGHT+IF5MRQjPv1qupkMKerR3TJa8F5ojOtH623jRIzHbwh2Yva4cWRDsheROKwicK7oG1R3ozY2p7TYivltOFVglY0=
X-Received: by 2002:a05:6512:3a96:b0:540:1ea7:44db with SMTP id
 2adb3069b0e04-54032c2f4a0mr306284e87.4.1733999358191; Thu, 12 Dec 2024
 02:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211051019.176131-1-chensong_2000@189.cn> <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
 <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
In-Reply-To: <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Dec 2024 11:29:07 +0100
Message-ID: <CAMRc=Medmy5EqTUWuQ-4YrQamOArKOK788iAY-=Cy42Od7y_Sw@mail.gmail.com>
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:55=E2=80=AFAM Song Chen <chensong_2000@189.cn> wr=
ote:
>
> Or we can use devm_gpiod_get_array, it's pretty much equivalent effect
> in s5m8767 even without fwnode specified.
>

Can you use it though? I was thinking you need the fwnode variant
because it's the child (regulator) node of the device?

If you can, that would be great.

Bart
