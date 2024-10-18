Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07120E32F;
	Fri, 18 Oct 2024 04:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225084; cv=none; b=KnNyBW04rIs8DkU0G1AI1W+djmAggnWjUI0pRhC4M00WB2hzxUOzXAEuYhxtrDPAXUKhHj57buLLH7taXNWnkdpJ4ikYbKJjY6PXoynbfmAtzmiFzaaVM+p4D6wJtwFEP5fNJdV2fRKJHtaPnghwDGVB+lxhcwYoZgE/D6gw2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225084; c=relaxed/simple;
	bh=U3v/6WiNUJ35uxZv6w6ULeUSkAOrx+S0t+ppI1Vtbq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1Cq3GKAlT5AWXYZV/cOnU7VAEDtFqZjK31SmIJpkFs08PA0MJ28t8zH2OrosLAuheP0BBKP7Ym+iPsKe57IOTCu9dKXvNVCVRIJ1hnVNrWSMPE1HzqCxNcqZzOzySa3Sid4ikpT0x+d7qRFTsjhsK/qVY0vKQf2IQ4o7AnpSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfc0NtxC; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfc0NtxC"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5f6e44727so1058899b6e.0;
        Thu, 17 Oct 2024 21:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729225082; x=1729829882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3v/6WiNUJ35uxZv6w6ULeUSkAOrx+S0t+ppI1Vtbq0=;
        b=Mfc0NtxCU1xYO1kFuh6JpUXt2xZ+Jj7cqY9PXMtKmHvCdOd1vxEzNLWUbHYjntapkm
         GpLUYG2jNNX4KSyD3UuDKXBS3TPwbdU8TZvaJCOraDrvCwHsSduFz7FeVao3Q0HlQ3vg
         HKCdcSFcIjOEFgy4hKV7xpQxbcFvXPZ8g/McBeuUgW6hBuOIPcXT9hHwsutsDeeNjVS0
         C5oPExZ+S6TuctHSHariV4THQdCxcTx0Ipwp6HAg4FZ3ahVWGVdL1Lupk3UqfuXicoOU
         nZ1PuX403/FMdPBiAB+aDNDCkMxflxRxuE/wLdHMD9MaFWKK4TYfGygbD2dmcMSffXwL
         eh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729225082; x=1729829882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3v/6WiNUJ35uxZv6w6ULeUSkAOrx+S0t+ppI1Vtbq0=;
        b=maiwi3+wG7qLy1bgR4iTrY2CTK0rPkM2yVdQB/oZxlCvWKjuczFivBs2G+En/JDvev
         Vw0ZHmPh7D46HzGQKkRhOYvu5f08WWTWBS/VL0pmplmO7RSEJDrIsLp4TNsGTA2kYIYK
         piFEzv3G/+HuldfcXe0WTI5L6pKfKJtF+NBw4iK6e/jYdoUyPnzQC8Dp495vekpa6Qyr
         OlHRTrjonFMHeeGPg2r1lKCXkwnzRUYKGJ0Cp7uVk/eCsURUR7y/5tkp5wBqUmn5ruAo
         q4tjsTc7QrfO6GSo8Ztuw0amz5ZTCVPJfKM5nVhGzedw2tE09ASytXzFlfLaPOtoGSKT
         SCvA==
X-Forwarded-Encrypted: i=1; AJvYcCWGFvHm69bOpRMwfy9HwEgNc18VZ1Pc4Kby7JTFa9E/jGUe9cWgmnkrryObCuJVDvqBfbVU9wykQU6oQPA=@vger.kernel.org, AJvYcCXiC7KwNGOlL2me8/s5LB7IxZvUVSv+z7WhKSLpTZGop9FfsOZrap9ZxD/T2gzDyBy8MzxT0xwth+dUUs8VHh9ZPwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVyQo7C7aNggr/iYl+7gI2w+Fip78pUYDQ9oQ7FVruhe4+T7C
	b/IJt8YRMHVPFbx8oFLGGp7i3RaikJFyUooRiIXf//FDY9586Mzs27SR5BNd583YyD3h5i1XwCX
	gez/+NjsVbIWc5SoYU5XNLLTwONs=
X-Google-Smtp-Source: AGHT+IHhGNdZ19+ochqKrxKWAOBSz02q8mUKgXln+6yfSiO3K7U/SH4nJVrViGUtJVSFXRjG4Z2GT3dQn56JMPDppWI=
X-Received: by 2002:a05:6808:3086:b0:3e5:fd7f:c13f with SMTP id
 5614622812f47-3e602c8438bmr546015b6e.11.1729225082458; Thu, 17 Oct 2024
 21:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org> <20241017163649.3007062-2-tudor.ambarus@linaro.org>
In-Reply-To: <20241017163649.3007062-2-tudor.ambarus@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 17 Oct 2024 23:17:50 -0500
Message-ID: <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com, 
	javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org, 
	luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com, 
	bjorn@rivosinc.com, ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org, 
	kernel-team@android.com, vincent.guittot@linaro.org, 
	daniel.lezcano@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:36=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> Current form of the mailbox framework doesn't allow controllers to benefi=
t
> of their hardware queue capabilities as the framework handles a single
> active request at a time.
>
> The active request is considered completed when TX completes. But it seem=
s
> that TX is not in direct relation with RX,
>
Correct, and it is not meant to be.
You are assuming there is always an RX in response to a TX, which is
not the case. Many platforms just send a message and only need to know
when it is sent. Many platforms only listen for incoming messages.
Many platforms have TX and RX but not as parts of one exchange. In
fact, only minority of platforms expect RX after each TX. Btw, what if
some platform sends only and always after each receive? For these
reasons, it is left to the user to tie an incoming RX to some previous
TX, or not.

Regards.
Jassi
