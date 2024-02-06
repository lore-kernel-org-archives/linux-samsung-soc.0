Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A91AB7FE
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 03:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707191104; cv=none; b=L4Y7fa9A3o2Mg7Elz1O0ddenscleuVomMf0n9Nai4aRE9ZbhA0uiqgE0q6B6gnkGKWS1XIdYkWr3Z0M4vhTHqRxvLcpPvQkpJZbwFrq6zcO/UubylVwsgcnm0e9OfFrT3oNCtxhDJa3Tvo65BEcph0snWpsKNKTpFFAnc7V9vu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707191104; c=relaxed/simple;
	bh=NCpdtG72ou8IMMEEOZx2eNb4QN8lGLP11EGhUkbTZuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V48Alu88r31iW1Xc8xGytEGvc6xeNj6kmY9cqG9Y+aAleqLYiu+M+cPCQtYaOrh3oBxsfhzkrDMuCDkFrGQmyAeqLCUuA2VK7y8ZU5/6gxuyBDITsXwN4sePQswoBYVmopfBzgKHnEpgiwuV4BNgVPi7qhctzWJhSzj2fjldJCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nn7APaEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nn7APaEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BDDC433C7;
	Tue,  6 Feb 2024 03:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707191103;
	bh=NCpdtG72ou8IMMEEOZx2eNb4QN8lGLP11EGhUkbTZuI=;
	h=Date:From:To:Cc:Subject:From;
	b=nn7APaEBv3Q3K8VrLJRhI7W81qpa7kefB3IU0bhL7lJJX0Kt9N9gvdBkR87Uu0gcR
	 yYFuz89Krf+FTnRu1dElqbkGkAYTAhoIRzKxXzCW8J04DZJ9QCakSwzpQ5MLo+LWHD
	 WpszJHl5hrtL+OWcl2RPcWIvqaIZOyFGw1NRNmycDLdAAz9BENHdTPRaDByn0WaTzM
	 UFVIzDyLC3jS79pyDjfTgdPwdMZmRstdRvjeomNMhs0GcLWwuX/ZoLescp9rNfzpOH
	 nEhzy2sktXFQDh5BMKlTIqdVDW/vjUjL/1RkhSr5cL5GhRthZPmgoXFvw96nT65mgw
	 pvVuDikcrIKCA==
Date: Mon, 5 Feb 2024 19:45:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org
Subject: UFS storage support for Tensor/GS101?
Message-ID: <20240206034502.GA175333@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter!  Thanks for all the hard work you've been doing on upstreaming support
for Tensor/GS101.  I've tested that the latest upstream kernel is now able to
boot to a serial console on Pixel 6.

I'm wondering if you have any plans to upstream support for the UFS storage on
that platform?  It should be able to use the already-upstream
drivers/ufs/host/ufs-exynos.c driver, but changes may be required; I'm not sure
how many.  I'm interested in this mainly because I'd like to upstream some
patches related to inline encryption, and that depends on UFS storage working.

I'm interested in helping with this, but I wanted to check to see if you know
about any existing plans first.

Thanks!

- Eric
