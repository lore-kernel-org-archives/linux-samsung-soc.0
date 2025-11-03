Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5822F39A7;
	Mon,  3 Nov 2025 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164241; cv=none; b=iAVLbIZDlZTKF3QIodOhlj+Yh7K9zuapeclOH7mcC3qMErnA/4vH6gd9RJq5v8RriuUkkMKk28AjU4+bpv/4B7HFaPvHxIYG8vn3ov3EPsXlYK7KhDo8hOFU+tSYfggjif4VEOhXTiblSZAwWrwKjErMgVd5Go0M8qEWcp0ICiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164241; c=relaxed/simple;
	bh=9RzhQqecN6YFsQXxZsZSBnwAFeaFnaljJyT67SZFxMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ch4ZAr8gAmFHYWSNoyxCvcAcfAYa62X4aQZiUzStl6HfkU38AfBlVvrVfT2K/pKw9fRtCxbGliYF3io6jpQiVnG6QnKwpnCqtSYOFzpp6/Oa+hWqPSwRQxPz8FwD/Wnc4XXOkJ/4ImvtNN0FLu3ud2D0q0I5GToXwfjyJgyy6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFM/2cKZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFM/2cKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27298C4CEFD;
	Mon,  3 Nov 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164240;
	bh=9RzhQqecN6YFsQXxZsZSBnwAFeaFnaljJyT67SZFxMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFM/2cKZiOYPgwzPgB45BzAPDDsYfilXWPvAgYafNmVfx7KeFC+R7U67qSY64knv2
	 E0sRkiZ1NYNk/cCHmB5wQHg1YmfX98q7ZnxokhZenMFarmsorzV1LTt+dkxHdaj2Pi
	 v/8b/EEjuQBfUxp2wRX4LHctWKzSYK2auuY3gdg+9U1OcI7gZ4m5j66S8AR6fP9Bb7
	 5IMgdvv6iZPfzQPQ4vqBsmDygl7ZDGDAZxtmAdDA47AW3Td2iC7zthxn6jEeVgBmqD
	 cmt1Ha+3SMcZDPPb0NUa4Jf+70ofWI2sxKr1MO5+QiXoWNjgFSLci5i70qbMguQk0W
	 qmLov/yZ5sI2A==
Date: Mon, 3 Nov 2025 11:03:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] soc: samsung: exynos-chipid: use heap allocated
 driver data
Message-ID: <20251103-sassy-flashy-panther-6b9b42@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-3-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-3-d78d1076b210@linaro.org>

On Fri, Oct 31, 2025 at 12:56:02PM +0000, Tudor Ambarus wrote:
> Prepare for GS101 chipid addition, it will requre more driver data. Use
> heap allocated driver data, it's easily extensible. Together with

Moving from stack to heap does not give you "extensibility". It is
extensible in current form as well. It allows to use it past probe,
which probably is what you wanted for some reason.

> the change s/soc_info/exynos_chipid, it better indicates that it is the
> driver data structure.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Best regards,
Krzysztof

