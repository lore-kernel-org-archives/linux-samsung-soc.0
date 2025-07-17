Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4F1F130B;
	Thu, 17 Jul 2025 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763019; cv=none; b=gtEato7UZR7ZR5jmm0PWCCxfS4zpf6TbHRDilkGZxLrzv17horv6EjkBuDGehK4EOVWygRqFgWImpFLlc1og7Poh/Egu3KHhKgYdu1l1octAsWXKETCaZbQXWyiuDVoMUqIL9L7ZcGa1zHk9a1oOqdvu0hWefvYY9BojO1Ipmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763019; c=relaxed/simple;
	bh=c74Ddmny7d/Q8zvuy5tPE+SiwFDSCPErUhju3WXd6sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tg/z8xHAljR/TGZrO4FGyytsZIy5xx9gjk+5G2LbKscC6c+yeHQpLeeZw8k84Vm/2j3XH1+87hsoCsQ7PbivpJU2kbA7dsMcbSVtGshZQtLdwBAioZlj9QaIXplXFGe1zWZesgeazihe5xaNcmeJMQAlsJhNeu445eZyLD0qXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejwqsEJe; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejwqsEJe"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-88131f0badcso1174641241.2;
        Thu, 17 Jul 2025 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752763016; x=1753367816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c74Ddmny7d/Q8zvuy5tPE+SiwFDSCPErUhju3WXd6sw=;
        b=ejwqsEJepUlLEds02509lx/fnmzWLijBqGknOT/N03z9Beto+Q4VC+4P7nGUeG3gPB
         pUZ6vw0n0RYzfQuPwGhQBAljv3I887qgOC+UxV+aD38k+6sU+Ry0fwg+B88qCIs+CYFl
         d9rYJN/Mo3zH0hgKf1zKfJq+E2rey9AY/8KVKlqPpcThOBwP2/tc0MDYrGvPE8TBrSs1
         9jcfvbUfCG2AO/1uE4jFjv52eJBNpLLLgsPBjsGv+KKH7UvI+faNEUcYQHNoW/kKWYSf
         2Wv56495ZSa5El4zl5V+HoMGsaPf+ZYr/dNHGzqoJMkh4tAQwAEMyeXJhQNvAEsWCTGa
         jhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763016; x=1753367816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c74Ddmny7d/Q8zvuy5tPE+SiwFDSCPErUhju3WXd6sw=;
        b=ANbSm+1TkLhWL2KZhdw2FV2wxgHXVqs+CINBBoq2qQyKfXw4fo8seDTc7JL1PnVER3
         m27iN+i2Ts4j2YBSl/XR0+ufJGDR/Mry4oMhR5lT+AK/cUtWP9wclldcsuHcdWb4O+aW
         oWz+ttVDeFSouuyywLUbwAJ8656ia2tgzvCX1zzUOIGvmnoLs6wMCFRs79EcwUrG6I2W
         D4LWSO6UCWZgXzZ+lctKe+izovW/iiZjGgxiNo9caTQoeQzhPlSykRcExUXYr50cECP8
         r/o+275P7WHI0bf6awLKShTugptu0JwvPpg2X9JDZ1GQwpj1dQVJXKzHujx1C9m9oguR
         +HRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHi6K8FMEJHqnN0XSwtfo1ucF6r8ymMOVA1AtiE8tB5jkBjYDlQBNO/T5f6/cf473U/OxyvrykTHWnk2/wvpLDyRM=@vger.kernel.org, AJvYcCXcb6/7Ru0NSYmbBt+37fL0UMiIG+ceVco+kBDPE1LSTOCAPNh6AGMCn5/Pt0giVB4bHMfSeNaA30MZu15U@vger.kernel.org, AJvYcCXgeQLtDybfoThfFWilQ9bEUE/NgFv1tYaB9J+Z0/uWBdwrZRWBahsoBqtdx/srNnz6VGQEZA7K8Q70@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbApzX5+WOlDO14Mi1yTt2KVWUqogJdD+vg21/29ZUt2pYF/E
	yF/mwl568QihZoULxie/S4EmaaeAjL8L/TWbcU1kuFEZkxJYLLjpIDkfLazq+oxtBFo0tlSG+gY
	3uJ+hkksrX/+5BzQjJp/lISIwXrSuOUQs5g==
X-Gm-Gg: ASbGncs/suVOHm849G47mwwCtMMRUh8rKoiXvBMU2XpfoHSdI4I/3rkUegD+x0rTSAA
	XrkyOyVlFJjBao7NikkpqwtxWV+AlXLke1E/OtMi+RhKJeYc6NFtgRFef+ZxwFbSbe9KCYbpXrt
	MGUxJ7eLG3ksu1FOq7i7T+H5ccBUlAhsOtYLjbvN47v49jeDi2fp9XbfaqaAccUKGiGlaDL1UAK
	HVj94w=
X-Google-Smtp-Source: AGHT+IE+7QebVg1PJtUQ7/XpmUZhm93OR2xRVQqcKd7qe0C2zFAgyOsdS17jNEBh29q2EIdokNw6rguoyrsgyl09dQA=
X-Received: by 2002:a05:6102:5488:b0:4e9:c7c8:5e24 with SMTP id
 ada2fe7eead31-4f95f5a8c9dmr3267535137.25.1752763015982; Thu, 17 Jul 2025
 07:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
 <7bec6fc2-6643-4ddf-9475-8ead4b312912@gmail.com> <CABTCjFBTY4NV2yKyRO31MacGFAnJ4T-viDLrXkPs9z66VU6nyQ@mail.gmail.com>
 <3e640051-35e5-4eb8-aa00-cb57abcbb919@gmail.com>
In-Reply-To: <3e640051-35e5-4eb8-aa00-cb57abcbb919@gmail.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 17 Jul 2025 17:36:45 +0300
X-Gm-Features: Ac12FXwMrvVkakhGq3qs6mfiMZAI1z6JsdyemGhwqGHXQaO4OUXLMjB5dLYy7MQ
Message-ID: <CABTCjFDQoQcrkYwBhaH0bzdxHd6OsGh1J+iFqme5R3HfLdeq3g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 17 =D0=B8=D1=8E=D0=BB. 2025=E2=80=AF=D0=B3. =D0=B2 14:33, Iva=
ylo Ivanov <ivo.ivanov.ivanov1@gmail.com>:
>
> On 7/17/25 11:12, Dzmitry Sankouski wrote:
> > =D1=87=D1=82, 17 =D0=B8=D1=8E=D0=BB. 2025=E2=80=AF=D0=B3. =D0=B2 10:28,=
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>:
> >> On 9/26/24 12:47, Dzmitry Sankouski wrote:
> >>> S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> >>> panel/touchscreen.
> >>>
> >>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >> When is this going to get merged? This patch brings the regulators
> >> functionality of the pmic, so not having it merged is odd. This PMIC i=
s
> >> used on other devices too, like the Galaxy S22.
> >>
> >> It seems like this has been hanging for almost an year at this point.
> >> If the author won't, will somebody resend it?
> >
> > It's already merged, see
> > https://lore.kernel.org/all/20240617-starqltechn_integration_upstream-v=
5-2-ea1109029ba5@gmail.com/
>
> I don't see patch 3/3 being merged anywhere, nor is it in my linux-next c=
lone
> from today. Do you _not_ need it anymore?
>

Indeed, that commit is not present, that's strange. I'll reset that patch l=
ater.

--=20

Best regards,
Dzmitry
