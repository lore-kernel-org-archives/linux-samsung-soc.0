Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FD282EE;
	Sat, 21 Dec 2024 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734747567; cv=none; b=YxC0w9T3iVehndVa03mAPpib0MZIatpDYc0wJdqiSWfOOPteTwBhF87vca6XKyWzkaJikNzST1KB4s3gpAecQq511Kej5WYp5xlU/R0JvEH8tsPPISEbagrv/B2JzMUSB8yZMxbqK7mj4W56MJGHM+c1CDzBPwLGPknhfsjnL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734747567; c=relaxed/simple;
	bh=MFHZW+DA4786+BTEsULshpDqQAEKKcniZjYuNTdQ4OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJI/0Df49IaaNbIiBsYN5NlJaumjE94hbBjwfykz75TzZurKxQ9RT5tQwLajWO4aFkODxORXPGSlxWZCYbteVkmmjulr1pEuqgJKK39uZFJ0YWzt5+xlOTuBoxpXnKilRnHCn6zne3TVvUOIpEYxIURII/vlSbPKGoQ4ePsgb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeBb5LZa; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeBb5LZa"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f31f8f4062so1064388eaf.3;
        Fri, 20 Dec 2024 18:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734747564; x=1735352364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99y9Gx8J1zxXZLANLv3H9dAUA86Q1c/9yGCSI8+WhU8=;
        b=JeBb5LZaxgo5dGTKbtC+p4WovwcvyCKyJihGhs3T83Z/W1WSc1g50D7wzvatgPlxHQ
         ccGF92uZY2ES26yPG8DV/IKlfCyDVbSczIjuAXswTeL8PcKQRxp74S45ShIRKmQ1seP4
         JOy/FFuMq5qgkZC/iATqtocdnt5SRVIU30A85U/j4S2qoxWkdD0ONtZo2MCATnRSjg2/
         /JpYwqGeD6cVELE2iuckFcjo1/SRw5pRwLxB/qD/cEW/R9VMUgSk79jsvg4JOIQhMAlv
         cksC5wDpKYomo4zb0OvRwrqMPjVDEIVD9ggE69IPeFGO7XUKo6IsJ/2HYidxqWJaMVq/
         n6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734747564; x=1735352364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99y9Gx8J1zxXZLANLv3H9dAUA86Q1c/9yGCSI8+WhU8=;
        b=bqk0ooKOEEd45zYVx4rdfR/X4r7mDbg5iG5A/dS/fv9zVJAEDk0XZzjh1bvTRT+LUL
         UgqpquvY40vnVMXeCTz5NYu8qIzwJCgzHuOe/Duk81FFXjNRoJOZmbfsGAD2FDgcUhzM
         MWmGh9YvyIR+qFjiGI7Z7noBME7S0FZ2x6JwxZaUE92Wn5R5geV/HMGb/2I/1c57Rll1
         fHouwTVxaKsD0ibe+bnN2Mj3IqQI7S+ZdTFn8GGGOclinJXHxFy3yoNvbmkfYI78//aA
         vkX5YneSeJWiaCNh+lUep6BQKcJ7tBPfJU7zIF630bd6lgMaStiL4K6+Fo5pPWA12ZzF
         KKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmlZXVzNN5qpk7m/MOAFdYzDmZtniXXnBBs5J07DKzW0Jfv9cKST4klkOOTx2c6zQsn+/SZX5aphQ+@vger.kernel.org, AJvYcCXC4pZVZwiYs1F2aKe2zszojS+N/mqLQUUiKvDlSWESF2AiNad0AN88fVU4tlxro2v/9wYaZFSkC3cyEhQrV9/Ngxk=@vger.kernel.org, AJvYcCXni0gvOaGWzQDM9/3Q8doHsetPOjJWIkDnJ6aiVGcfPDxnlbGWalUy+ox2NqMYKPShgeRXLW1csuoHWxsw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgz70y/ixdthL0SONAJA04hoNwM0l7j3A0Q6vgzh2U5RsJ4nrv
	8c4C5SdGTUu+komwJnfynjNJ97MB+rnDLuTRNqE+cHv8Miwfz/Yk2Ae4SaACi4JNEP8k2scPoN+
	2mcF61K9ANwauST/b4n3MlREfusiAKT/X
X-Gm-Gg: ASbGncuo3YJTPoywHO8SgezonB3gkrURIsmWJr6KvoT0Q+AZaVFUJsdeXArIiQtsJ3a
	EtAbwdb53zrU+wO+kRCIJoAIK5OdYVLvJi8tz8Sc=
X-Google-Smtp-Source: AGHT+IG9p6et1FMSkfp7z6yuIUHa7COZ33lKNlvvXbakxbyS8JSwHcROiF1O8vCBbstSe/5GDdun5/C+sJ69wPoxTcg=
X-Received: by 2002:a05:6871:808c:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2a7fb00b537mr3084159fac.2.1734747564617; Fri, 20 Dec 2024
 18:19:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org> <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
In-Reply-To: <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 20 Dec 2024 20:19:13 -0600
Message-ID: <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 4:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Krzysztof, Jassi,
>
> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
>
> > diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbo=
x.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>
> cut
>
> > +
> > +  '#mbox-cells':
> > +    description: |
> > +      <&phandle type channel>
> > +      phandle : label name of controller.
> > +      type    : channel type, doorbell or data-transfer.
> > +      channel : channel number.
> > +
> > +      Here is how a client can reference them:
> > +      mboxes =3D <&ap2apm_mailbox DOORBELL 2>;
> > +      mboxes =3D <&ap2apm_mailbox DATA 3>;
> > +    const: 2
> > +
>
> Revisiting this, I think that for the ACPM interface mailbox client use
> case, it would be better to introduce a mbox property where I reference
> just the phandle to the controller:
>         mbox =3D <&ap2apm_mailbox>;
>
> The ACPM interface discovers the mailbox channel IDs at runtime by
> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
> specifying the type and channel in DT is redundant.
>
> It would require to extend a bit the mailbox core to provide a
> mbox_request_channel_by_args() method. I already wrote a draft and
> tested it.
>
> Do you find the idea fine?
>
Looking at v6, I prefer this version... maybe modify it a bit.

Even if you get the channel number at runtime, the type (Data vs
Doorbell) is static and needs to be passed via DT. You may have
  mbox =3D <&ap2apm_mailbox DOORBELL>;
and in your custom of_xlate implementation return any available
"virtual" channel. You could use 'void *data' in
exynos_mbox_send_data() to pass the h/w channel-id, instead of the
index of the virtual channel.

Thanks.
