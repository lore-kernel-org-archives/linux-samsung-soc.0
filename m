Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECEF1B4236;
	Sun, 12 Jan 2025 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736701187; cv=none; b=mopSrg/zhWPblZxATHugf3nhmAZ8lE8XQTwhOHZ6KjCCC6/CoVNraqFQpBRHx+2TQt0aQWqJIr454fcueLOo346QsFy3wHtYA3HaRRVBIyfJeApB3DeutB6Cy77idEeHPgYg/PlugJQKb3DlNrg9hpWTWLpyfj/eYhZtVxi+DKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736701187; c=relaxed/simple;
	bh=bNyYXhW+zhFq6eoO4rqSrLxtNpjjGxMBOGZPAwUPvkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kac0ZjygX9u++lmlG1w71PVwfVS3qcqwmMCaBVibcG/z5FaVlm/Dg16xMmiVSjc0u0oBMK32XKxSPEswmfq6XIAF14j+bz8H+XdYVZks3wJn9W8XcLhR15C7YDpWzg/2Ku4LkXqK567/yBQkiapl81JbgtacMEdigh3Mbcs5cp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOcTgTGp; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOcTgTGp"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5f6497fbccbso2386748eaf.0;
        Sun, 12 Jan 2025 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701185; x=1737305985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quwvRH4bGbRvrQGvh2yWVM8KSskEfHUR5/oizr6Kep4=;
        b=eOcTgTGprmCjZnFfXI4IJcPePEiaW2gvWSRZ6xf4xbf3GcQyuubf3/l4YhjXup485h
         1+NOPyNfIKo3me22YaZU5KIolqbkmYzp5iaaN/5XwQE3pWHZs6fbyJjEIj/4Sn99e+I/
         KjxSuN/G+KxDKk2J6powJw0QjgZWmhvJIrkBz2Eev63RN92tvJO/hiuceGE74Tslg0Ow
         GdLfVYUELLV7z26uzJUDCBpdeZVTnLYSqcMl2m+p5kEarYTqgHI4bfRtCSHJYBIeLq9u
         2aVe6zzu+BLybW1pkpPaB+6+cNkTd1gSo7DDK/jVqGMTqysDFpsudKqmFBXVXB9vfvJK
         eNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701185; x=1737305985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quwvRH4bGbRvrQGvh2yWVM8KSskEfHUR5/oizr6Kep4=;
        b=gm+zb5Y0HibaH8i/K7QCPUyOrRNkgCoX/wHDwLZiftzeSE4nkTwmW3HWf4ccpm5I4G
         Dm1Os80nnGvYlJfwiYH7UAONq9VBbkQWG+Dl5wLPLhlbXUzsDpi9XKODh+xG95IykhGx
         wbYEcuI4EP1fUCk7o03pbZXcdPQVumzJGxS+Q0xHBVJWIO0LORcw4By/W6EEG4q6SiRh
         SvsCs1ZmjEUW093yyYUKiHjr40EXlI8WHL/cwS6cR1RojVtSzZ1QaCq3a2VQQ1NRhtiB
         jqO0gRkdIqVOza1XW8LcKANG99cT99oyN+c9aRZCm05sybtxP4h8xytzzZ+nO1CMS/Gv
         83Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVow6F5ONfOffGqEk8KbneBOtB2Zh9GllDBQUHj1OGToM+rZM0gKbAGl17Frrrm/pe9OXzJxSiBTtRdJ/3OTT2RopI=@vger.kernel.org, AJvYcCW5KiAzK38VesOWtbFmIYh3kaGoI/HFF0O64t+fi4Y7QgSJHZV2/Voxj9/muC5GzK9cI5wfc+eFGbJ2sCHU@vger.kernel.org, AJvYcCX51CHPi4nNHtjG8XsDkIhzIYBKamUdX0FqaudTuRujyO0W5A64Nrcz1PwLXL4vVJGzoZP+EcptgIoB@vger.kernel.org
X-Gm-Message-State: AOJu0YxIoCW504+W3MwqDXAvKlKnMSo10HPk+fUsXhQRB7APXUuF2gBv
	yyzaD5aKszOS/XDKJCiT+rTbcVHMNd18mjoJkvniRKq+zIXiOOd+Yb8MEOgXl+vsksLUaMf3T8J
	Cxf5SlH2dqq9b6ERNaAX7xkLc00Y=
X-Gm-Gg: ASbGncsLQxNtyjanPh7bjqW9CIGpWPYHtqtAwEW6qZVDljE8DM6V1nfS+352jaQijAw
	dRuepmT0cMI3H6ITnrYA5Gn08gKmFXlI1+QIlFhA=
X-Google-Smtp-Source: AGHT+IEQfGA2U8QldzatkkBgSiG0ZMHBvwWPEdHTVVXcVjAFGGsjXDL6nXJioSINr/i9gFuWSbwMCv44uKtuvxQmJnQ=
X-Received: by 2002:a05:6871:5e10:b0:29e:37af:a943 with SMTP id
 586e51a60fabf-2ad80907cc8mr8709428fac.18.1736701185046; Sun, 12 Jan 2025
 08:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org> <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org> <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
In-Reply-To: <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Jan 2025 10:59:32 -0600
X-Gm-Features: AbW1kvbTrH1X7Mg1VWhps-7-6TpTz4UKuTz3YpkSXF5eHOwG7kdqYiJ57bLEtrs
Message-ID: <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 3:38=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Hi, Jassi,
>
> On 1/3/25 9:57 AM, Tudor Ambarus wrote:
> >>> Then I updated the mailbox core to allow clients to request channels =
by
> >>> passing some args containing channel identifiers to the controllers,
> >>> that the controllers xlate() using their own method.
> >>>
> >> This is unnecessary.
> >> If you don't pass the doorbell number from DT, each channel populated
> >> by the driver is just a s/w construct or a 'virtual' channel. Make use
> >> of 'void *data'  in send_data() to specify the doorbell.
> >>
> > I think this introduces concurrency problems if the channel identifiers
> > passed by 'void *data' don't match the virtual channel used for sending
> > the messages. Do we want to allow this?
> >
> > Also, if we use 'void *data' to pass channel identifiers, the channel
> > checks will have to be made at send_data() time. Thus if passing wrong
> > channel type for example, the mailbox client will eventually get a
> > -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
> > misleading.
>
> Shall I still use 'void *data' to pass channel identifiers through
> send_data()? I'd like to respin everything.
>
Yes, please do.

thanks
