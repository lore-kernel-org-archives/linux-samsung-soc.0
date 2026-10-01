Received: from mail-ed2-f43.google.com (mail-ed2-f43.google.com [74.125.228.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE34BA9FB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847315; cv=pass; b=qpp5q2JfqpEroVuQH17BX4Qs2X2oa6koTCckNRHpEcwigBHaNjMI+05l+qP17d0NC61R63f7uoy3QrPKLLOVYtd/qtgimY6Kfadg1kfdPjeDYQ0Of9MpM1f5IAcmaifX7rsum9/EStxqPY+hJF6hPLq/cVisMwjEnC6VlP5yDdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847315; c=relaxed/simple;
	bh=pGCU+YkLRfAjqDH/u84zLx49H7YX5I4bzZSwZUj/YFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNvli8YsDHx9LAZ3BTuH+Nq4QS17/tKkK4kReJjaHnDrpEde3KO34Sw1w1twnyYm4IMp4NG2jg7z3pcKMUyDyPczA4kC6Zfr3Gi+d3g/TSpj00G9Co3cy2gJ71MghEN7mxKbeJINVYKxaMIoaEQmdig9taetfqFhEO624jr/Ues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd7T1gK8; arc=pass smtp.client-ip=74.125.228.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd7T1gK8"
Received: by mail-ed2-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so2389469a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847311; cv=none;
        d=google.com; s=arc-20260327;
        b=m0OjEqXIHuWVy/mdepx/Uul91lXMNnbqZjQfdfCVyhfE0198t40ni/eg9N6jUzMfl3
         nmpjEE7whDCC84W3VFhl8mWsxwSvG8RSfD439vF9+BsavqjPhrWy810GBsvqYxHaTANN
         pGFgl/ujvlxjMYz5BXqpUGXNFvMSoXhYVtBN+1Cg01ggdvxxze9KZ0lTTwj0czkqyT7B
         AQQkO8qdH6JeoVnVYq3X128Li63vUsTfJwBNUcv1JiuBXMIQ7lmS1Sy+FALUKN8d+A9O
         XUHUFMsXZhWEAbiq/9uo/YXJSw+aPIhXgSC0HTiDwhLGRcEFhHh0e7JRuARvZ9RRhJ1d
         yTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        fh=lTB9dvw5z57ctDJ8ik5VihHiTCU22CPxoMV5X9KNTdo=;
        b=q9hzSXaX6/PGkdUxGsRbmD6J+Dbh6pATukTOJbnZ4qfvMDFUPbxMi6HqeBM84ODHsB
         kzmHkE9XWoN6Lpp9IfE+V5pV8ElYsYRyZs+8Mcpr5KMFI5s/mopJBJkwTv/8h90Aoab+
         +Em7UW8+xUJOiLJf/cDP1sKZpaIpYCGUQbjWLVcSYdiWY6JyF1diN3qLFicgT177DDix
         /HfOzYZvpPkMiliUIJe3jKwFMDj7qTXgTz4V4eriQi6bI11jNwlJA75vPck/Dwt0N1P9
         wv+AMEd7PAfu+MqAUp/PUlmauS7vEMEkeQNpnQFsgWd8bAgfTVVRqIk295hKC2YEtPId
         NoEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790847311; x=1791452111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=Sd7T1gK87cHX73HpDC9wTDcnlwIIaXy5PqhY4c2sGOrCxmMdIx4rOvNbQn2CPEUDXu
         gwE5IOMkEGtbfx4XkZim4q2TUpTZQzoRC0B8ZdmA4Z24Ix/KenG3YoHIwx3MAYaFmO+J
         79eeOg7h9GHcm7IBIO1976lnq7QaaGro4G/ZEN/lpW0nvoYkF2YSu6jykQ7q4J7jIiB1
         KUth2sGQZKhZykdCjBFqkO/n/FTtlLPZsXzSGeqcQDlrhypqqbLgQX5IgfO1V+Pgaqkn
         Xd/rvmey5JbFXViUf+xiL9oe/0gDfyB2176JFotDsBCjn5ZgciXTBQmJ0DUTHucGgPPo
         +rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847311; x=1791452111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=mHqGJSyRl2DFPs3o7iJlhNY4oYIfa/SKBTsSdZ8ZXxlXZYDik91F8D1qxlMU7HQmrj
         Mt9eb8ci9vGidYe4M/M1kB7iOkX8PXIGuu5x2t2X7+4PASZ00PH9hlIo0Nno8qwYEnMi
         3ySMeqlkqnPWT4sUmW7XUfuItobDBU2rkgCwcv/MjMydQ9yFEZZuuC1DJd6XnAw8Fi3G
         SLVjRSc+pXxPPu6Szx3BjZqklX7zjL9OlGXvpV9nm78mbB2G/moE/PFhu/hk4zG2nqkF
         p23ZFbjTmgaTSNmgWyUpUfKRNKDh7pW6QzvQisWLiJTJmVTWH2So8u0P+yWSEbQhC6zy
         aamg==
X-Forwarded-Encrypted: i=1; AKwUvBzdota5WrnNwmhMSjLC87Mrxkkhs0zJRNc6dIgR+AxDA1SztySZsBr//vbA23s7N9Tk3z448rKv/d01lS5nFLp+8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpZSQwb7WRL7+MXk8nwD3+evZ1aWlugQN4Or3OQ1s04xZZLxgj
	4vo65fI+cPNcNysG1P2Jr62n5FZ3byptCFb5NWtNixdQ6nJTZCvOKdzm4XckwPkR9ZFidu42ksF
	RgPIT0dKTdEKYP90XJIqYl4+dT3Vdvg+TyWk+g6dq/g==
X-Gm-Gg: AYBFou05BuhwQkBLfmbBcNq8JWBErsTyeJBNAZDiKTzy2PRlT6GmFu+JfBxXhZaFRbj
	uFfXpXLlq+b7YQs9tucC0ZM2A0cM6p6QK4IcuaSa7oNyESmQZBdxCk6hIz/SRjj+26ObMj7dU8H
	Oxkbz+gwkK/qk4+xmqXMR9xuzMiY3hCvdVoiHY/a94zHoB7xwrxpoA+/5SAMl7N8TlTYJlQG8g6
	4k6/g2B2Cl4TFLSI2jDrPbsvtplimv6ic4hqNsWOMp5giS1Iqo+4EAzZwwUUpp4rcOpncGkzXrI
	B2aVMSeEgRpi4ovYqj5hnhIFyyK8tFOLIK73dNSVUsZGfzKpfPQ+mNtg/PwkI63IdJXaBYv/Sw2
	5u6by1cKgAYX2LQ==
X-Received: by 2002:a05:6402:c4e:b0:6aa:490e:5506 with SMTP id
 4fb4d7f45d1cf-6ae1996fd65mr3129163a12.39.1790847311405; Thu, 01 Oct 2026
 02:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
 <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com> <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
In-Reply-To: <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 Oct 2026 10:34:58 +0100
X-Gm-Features: AclHuK_YpgKbBYxkFtRgH6bLpQ_dPXQcVCNkRBcwgfpIDgIy_RrFnu-Dzk9rMWU
Message-ID: <CADrjBPoppW+tAY3QXgawcCx7nvvSvWkQDKbP9R4r_4zAU3vWGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 06:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 17:47, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> >>
> >> Fix newly introduced DT warnings:
> >> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588=
0000:
> >> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" =
or
> >> child "reg" or "ranges" property
> >>
> >> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for franke=
l/blazer/mustang")
> >
> > Is the above git hash correct? In linuxnext, I see:
>
> Yeah:
>
>         WARNING: Unknown commit id '80f23487d554c7', maybe rebased or not=
 pulled?
>
> I'll fix both when applied

Thanks Krzysztof and also Doug for noticing.

Peter
