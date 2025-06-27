Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE4289E37;
	Fri, 27 Jun 2025 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060487; cv=none; b=E+T22eDEL6cmvqEfvy6qBXc/HziDpZmsqdaeP22XeXddoQk5GwHQ7CNX1CVlhGeqrngwpuwOEyhxahbe6wnFiLkgoQeqb5hu8CIx02jd3X7IrYYJ5md201fevWGKXyNUV3VRdHqP7LkR/LkgC+Ay9/EZgdmdc9MVlxYc6VzeFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060487; c=relaxed/simple;
	bh=6qGjtqck4coO6NZjDUGE9y+GBqUOpbdnYaMZr6gFMos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJRgCvb6UMUuMKTi/pBogD/2KUrYn39AqUseUhGXFX1Cj+7ssjhU5Vr12lxzRMRTrWuYh5kijrmyHHcMEieojPA5RkCKDeoECaWk0Z7PQxN2Llh/ar50RdCr8/4gDlFBtestiltIwYs6mkEiTw/PQ3bqjiATs31T7HgpJWhnN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltKWYsBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltKWYsBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC49C4CEE3;
	Fri, 27 Jun 2025 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060486;
	bh=6qGjtqck4coO6NZjDUGE9y+GBqUOpbdnYaMZr6gFMos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltKWYsBVFs6COQQf8/KTq7n5oUd+XwK5vSrJDcKqAgqVp6fW+Hgz6NNtp/8aBcOrb
	 dWCUfItSGtpDrT4noMkswvJWAkH9mV6Ja+DilPt5pxREIy0JUDsmFJHsJB83b9/tMd
	 rj/OTmKxAEIzg4/gtrYXNfxXEm0OtaGd0rhLXJmr6zicbc3UT8RDTUio9G4gEE4+Fa
	 26A3IRj4/t3Y27ruVi+YQcdNtSOnNH/g9SuP7IOJ1W4KHXpHNeKV194HhMGSBrSoRE
	 y11ZBpaV5ZjCdqj6sJbH5aNqWwD5SbgevypuH/I6bqVDepAUSXp4hmydGwGUjaKZfX
	 TUSTeSaZRFCLw==
Date: Fri, 27 Jun 2025 16:41:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: samsung: exynos-sysreg: add
 exynos7870 sysregs
Message-ID: <175106048556.189134.1526670585968824295.robh@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>


On Fri, 27 Jun 2025 01:43:24 +0530, Kaustabh Chakraborty wrote:
> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

