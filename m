Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55D5221D2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805071; cv=none; b=hHrZthOYFipKXLEz1g5npQJ9eyIzW2hLmc+EZ4HAIzBmXAkWXjBGr9KVxc5INOSAOjW4fXRUizE+AyNXobEeTTg/6zUtKKUCMyWOz5MO6JouN3nyAkPSa/SOglf4TKMJfwtghwanCbIZ/c/qC9yuK1OPnRwgRGPWCMBTTgbiXKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805071; c=relaxed/simple;
	bh=57Vc/Rxq6ECImFy414KMdUxkvFyJc97Kymq3bNI5cJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EI5fJg+LNzTfTnuicqIUUQXVw9GNLwM91VhU9wKy+iqVSbNsV8EI7J4bf+X4yjByzDE6UiU5hcvP9fjr+DefJ8/9InVZPdGepPMgKeCGSZlo08ZCYEDZbk88MzWvCnA8CW08W3E9TYj6Bc56W2RCX7L6wjJpAvwS4DPxhkOrpyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiqAcY6X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiqAcY6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198541F0089F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790805069;
	bh=RAnpqMOGAC30OtTrLiH7M9o+wNye+/msCQcYjxQmy0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IiqAcY6XN7b7mnGoxI4st6GCzLG1dzDIQHAAxIp10Ug3k0Rzkc/ZHNWkLnxHyuz27
	 KeS/MKg6YaOy9b+T42Eae8O7DRK9Dsl+xQ5CAY88KM680Q9sAwBHEgrcynoqEzMPjz
	 p/qN5IEpCQoio4C14Hon/nua9+YCSDJnY3qmRTr+mkmjRMnwWmS9T4hMXHGKOQZHE2
	 CPeB3n7g/voQ7CK/N8KmTBF5Ifvht6kB/EZHrrQRf36G76wBOIOIQVHBTHMX2ja105
	 itTWkCKf3hHoUplwZWTwYuYdIVs7hECztStoOJn1vRI0S2Mug3T/Gkctbsj0xIiRbQ
	 NgoEgFVgze10g==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so50206141fa.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 14:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6AgtAV89WeqJ76mlHzaptQemQs4lmBVkpzBHcM5S4WjOx6K+5qQpYnccY1IIIT/FY6mwNOussyvrC9xx0ueUKAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1933yi6skCnGSxt+uN7+IkyLlGYUeqOY4RDFAiJA8tQWptBBp
	OAlOufBaUAPkQnQy5QQ4fm8Kwe/1DMyCe7dy33B7R1KWssOxEwsMnN0+lJjy8qPrdMf4UdHDNna
	XUG9+mAjQkCUfL5jb7Sy9/Vausw9iak8=
X-Received: by 2002:a2e:be8c:0:b0:3a6:566a:5ca1 with SMTP id
 38308e7fff4ca-3a7791dc08fmr9115391fa.21.1790805067836; Wed, 30 Sep 2026
 14:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v3-3-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-3-c94e51140509@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:50:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVO=NwD=Yt43v4FUK4orBuNuxGrYwcWS7vn9E27Eodaw@mail.gmail.com>
X-Gm-Features: AclHuK-YzUcFeKui-FBA-jpZiYYt9fNiuvjJIJfDEyhn_rhgVcM2vz6d1jIiXNI
Message-ID: <CAD++jLkVO=NwD=Yt43v4FUK4orBuNuxGrYwcWS7vn9E27Eodaw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 7:26=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> boot to a serial prompt using an initramfs.
>
> Currently only Laguna B0 silicon found in mass production phones is
> officially supported. Further revisions such as A0 silicon and EVT
> devices maybe added in the future if they are useful. As of today,
> these device trees boot fine on EVT devices with A0 silicon.
>
> A few things can be noted about these device trees:
>
> 1. They purposely choose to use the full 64-bit address and size cells
>    for the root node and the `soc@0` node. Although I haven't tested
>    the need for this, I presume the arguments made in
>    commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address
>    and size cells for soc") would apply here.
> 2. Though it looks as if the UART is never enabled, the bootloader
>    knows to enable the UART when the console is turned on. Baud rate
>    is configurable in the bootloader so is never hardcoded in the
>    device tree.
>
> Changes by Peter Griffin:
>  - Remove dtbo overlay approach and add individual board dts
>  - Update to lga-pixel-common naming like gs101-pixel-common
>  - Reorder nodes alpha-numerically by the node name
>  - Add ramoops reserved-memory (tested with console=3Dpstore)
>  - Add reserved-memory for bootloader & gsa logs
>  - Add reserved-memory for Android BootLoader ABL (used on Watchdog
>    reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
>  - Add osc 38.4Mhz fixed-clock
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Co-developed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

This looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
