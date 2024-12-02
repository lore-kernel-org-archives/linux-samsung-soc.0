Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01C317FAC2;
	Mon,  2 Dec 2024 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156102; cv=none; b=I9WllrxTxaBn5m+oZzTCb4Zs+UY0sIkeriUkI1iXMY/fNmCSdb5+FfkcaROBaMy9w4pDPx+NhZFy3+PJp8v/YxkN8WfkN3CY+VslOgBG2ChRxJbALbnPIEkEgI5l+/h6XOA5Yy2mr5qwvFOlQUVjhPnCg08Qz1ZzJPxC0m8i1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156102; c=relaxed/simple;
	bh=rf3tmdsNPhNTXCWTXYttONTJQUg5LXdbItehquCHLoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umI/kT1MubDq/+zTwGgPvTaSR29PbXlVk55oHOgjIjIdeJF+7kFWdQhelwZxUzX+/XU7Ciy3esSibuMTtkNUbzF2GZEByrGemK/kTuNtczacylqweUu4OuEa1qLn+UQEsmdkBgDs54Nn7rUmYMDggftPEpIQQQ1yTRTuep/ZvaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=E/bVuty0; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="E/bVuty0"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y27tj4c7CzGp3g;
	Mon, 02 Dec 2024 16:06:05 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y27tY2H9zz6tkK;
	Mon,  2 Dec 2024 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733155560;
	bh=rf3tmdsNPhNTXCWTXYttONTJQUg5LXdbItehquCHLoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/bVuty0ksgZbd+R3sKLadsOLuXj9zd02pmVZghBvEktX0XXII9fLQCOgKbmBFXB+
	 RdhUl2Vx2ickBwg0E9GZhEWO9hnhuhyRXGH+eSQ4io+fzWLeiot1rgzclGOSjcuXjJ
	 tGgemc2GLr/p2Cv6aSK9KGzuG3NLXbXhd383dHiaekyLYAcAYhS0wJ5qELxyEEBJYt
	 MH0KrR8AIOgxKROvRGNuGJ5jwd4rSq1jsGQ1REqKky4dQmsWxsf+qP1Sblz9M65UVS
	 /mmV+nJ9kPmqff15FFflHeiYQ1Bm01cuwZsXc3bAOMDqzLAM1xYEEbbrmzrnq+02yP
	 lIBNr9yS8+cgg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: ivo.ivanov.ivanov1@gmail.com
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	umer.uddin@mentallysanemainliners.org
Subject: Re: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  2 Dec 2024 16:05:48 +0000
Message-ID: <20241202160548.3672-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
References: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14/11/2024 10:09, Ivaylo Ivanov wrote:

>> +
>> +/ {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	model = "Samsung Galaxy S20 5G";
>> +	compatible = "samsung,x1s", "samsung,exynos990";
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
>> +		      /* Memory hole */
>> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
>> +		      /* Memory hole */
>> +		      <0x0 0xe1900000 0x0 0x1e700000>,
>> +		      /* Memory hole */
> 
> The space from 0x100000000 to 0x880000000 isn't a hole in the memory
> though, is it? 0x880000000 is in the 64 bit address space.
> 
> Best regards, Ivo.

Hi Ivo, This device tree was based on the work done on c1s and
Igor had also labelled the part as a memory hole, also same with
the r8s device tree done by Denzeel, also downstream fdt skips out
on this region abruptly hence why I had also labelled it a memory
hole.
