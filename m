Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B070194098;
	Fri, 27 Jun 2025 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010703; cv=none; b=IRVrWJJbeC/fu1jYRzKzJXgRhtQYRwWTcyDZMmOXOGyirk2Mck/YdzsucMeOxb0apolh53eJfkmTd/++xBfWXrvYx122/SlPwxiFVVZ29EnseHaxiC5uq1anCrCzfdZyGEAocIpxgPeu20gHoBi58esprRnUj1YF0D/dxTSpD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010703; c=relaxed/simple;
	bh=HGb1vMXe32XsSHfWcRtFI+ZGqVxo4y7L193Fa0hYiy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/OhwJq0W2p3m+TQvR2dhMgPgMWyn4lwJfAkP6S/bV4i/gyhzkf51C3yUKSGgC8PZFB2mxfdfwwRUN2SYyhnOWmHBWKP+v5DMcDVM293GAwj2hnnb2hvBuOWkqe88i9WPd67WROKdAgeNmIWEu2ZDE8yz3q/seZSswLwHPc8Kok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKO0CNfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKO0CNfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A6C4CEE3;
	Fri, 27 Jun 2025 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010703;
	bh=HGb1vMXe32XsSHfWcRtFI+ZGqVxo4y7L193Fa0hYiy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKO0CNfZ4IXFHB5zuTVdQuBwCskytFKoc6N8r8vNLZFAqnx4ojvWhjHPE6Q3RFPEv
	 CUirkN7UIYP5clNMpKUH9RifG9a6dZwNFJDG9oXLGc5+3a2HdZFGxzvHkLtTeR3Uf8
	 7EdEoAf0fv6EIjk2A43+zc5oHt9qCkYeH6I7GOY2qC/WirVh1XrX3saKJmgF2P35+/
	 J56GaDz5V32iFERE+wVSF8rBiTDm3xLdBA90XoZ61J5iBHRnuVH7hJiiVlXdDybmNr
	 XmOXBv4R0dEAsF1zlYk2Orz6r5gEGjhdFY8xv15MuOTuy9JTi54Qr9cUSR6yy9rB5p
	 SINPkyZn08ojw==
Date: Fri, 27 Jun 2025 09:51:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>

On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21,=
 Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> >
> > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > - May optionally require an IOMMU to initialize a display region.
> > - May require a port connection to another block, say an MIC or a DSI
> >   master.
> >
> > Document these bindings in the devicetree schema.
>=20
> Applied.

Please wait for DT review, giving us few hours is not enough. Please
drop the patchset, needs fixes.

Best regards,
Krzysztof

