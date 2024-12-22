Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D254EEC5;
	Sun, 22 Dec 2024 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857275; cv=none; b=eRge/dPGv3dOQApPDkQrYxcyITX5pqjPEBhjpwJMbXBkTr0SokgOfE3b9sfleLafSOV0DefVpbm0fWt3vCUBV+zkcQ7TdkuIB0cA7NTVKLqK0OEenWeM8imvljpakYJ01FLmvXqFG7gyZPGtt4WgZrXGLjFyW4W4l+D6ZoYVM0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857275; c=relaxed/simple;
	bh=aDmq08s7jSeCXUxMai9L6T3fSO6byx61vPUZaxu9+eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZeuAgLGTZ2TiREZq4CZtMimFlIGWI6xuox/slcXIuOvNgoCf7m9h0+yQFQ/1w3uTfJhbTfo/0g0nm5+HsPz2sDZDIz2+VD2dPa42IG7dgYEROXqVfqcaBQ2ZkgLmgaDR4c/u/xv1AsTjs/1iY10ZZopIJM89ivp01D0hzxFlsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNKoXw1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNKoXw1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066E6C4CECD;
	Sun, 22 Dec 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857274;
	bh=aDmq08s7jSeCXUxMai9L6T3fSO6byx61vPUZaxu9+eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNKoXw1IpeNzqiZKqXv0VqGTbwCxaMoorfu7RigTW7FfMbAZa3vnPPJ92FwoA1p3e
	 MY1iYjfW4yHApPnfOroShL5KWgsfG3hRW0LLlBSi8bDtCXO6Kq4itkdtpaXWPussRg
	 m7s1Ruj+46Xc7UrYEnRcDMR1h3gvfQ5n9LjKgUx1LUY7gWpzOlB6Ts23veXSnSnToe
	 Ve30bf0jc4RVb2VYExERRK/yDs2ZYF78X3UmZ7LTDX445Pd5gSg0apbobvD4l/WS4Z
	 9xl9Y7KzAPpiN6ovFc6YKMDXe/ZsX9zz/lgIMqanvvLreU4xgBm3fhWqHgPZ3bbDXb
	 fRgXMxxTUdpNw==
Date: Sun, 22 Dec 2024 09:47:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v5 0/3] firmware: add Exynos ACPM protocol driver
Message-ID: <24gb4sffg7qgigtei7ons6hrmdkd7jiby672k6xvwv4y6jmfoo@x52v6iigm6rd>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>

On Fri, Dec 20, 2024 at 02:32:50PM +0000, Tudor Ambarus wrote:
> Alive Clock and Power Manager (ACPM) Message Protocol is defined for
> the purpose of communication between the ACPM firmware and masters
> (AP, AOC, ...). ACPM firmware operates on the Active Power Management
> (APM) module that handles overall power activities.
> 
> This protocol driver provides the interface for all the client drivers
> making use of the features offered by the APM. Add ACPM protocol support.
> 
> Changes in v5:
> - depends on:
>   - Link: https://lore.kernel.org/all/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
>   - it uses the newly introduced mbox_request_channel_by_args() API
> - dt-bindings:
>   - drop redundant binding word from the commit subject
>   - remove extra blank line and update example with by complying to
>     #mbox-cells = <0>;
>   - drop Krzysztof's R-b tag as the example was updated.

This does not invalidate review. You just dropped argument from a
phandle, it's not even related to this binding. The format of phandle
depends on provider, not consumer binding.

Best regards,
Krzysztof

