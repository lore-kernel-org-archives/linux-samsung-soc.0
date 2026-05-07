Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33367373C10;
	Thu,  7 May 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160441; cv=none; b=Qsny+igcROZEvc/iUOxxshOq05JKvemkEQwbDiJXGP5w8rmGuoY8OKRtTsaehxDoyh1fMRrsqjQYnaO438uxO/kxbApl7JH9Q/B5idA8+30diFN+F/3yus0p1GoyXDi0Vwf6DnFtyHXj8Ofsn3EYicSbQbNYD97PU6YOWkY7x14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160441; c=relaxed/simple;
	bh=2zmpjvVUY+07HWWUcCxpxC+7KsaT2l7nu3KqtNlhEY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i7rqvz2wnRXa6iRaCiewUZEI/hOLL2wg9TQjdr7sPNs+GNqpsj79ypQ48avMAqQWyfj3Ky0+otk4snZt+vVgfkAw2rdIbNDp+U/qKOrXYVVN4pnadM/Nrm15ANIMkk/tB7fqrX+LMKiLKdw5kJIfg8lnfWUmfABODrNRnLxBvt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDP4jj7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDP4jj7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E24AC2BCB2;
	Thu,  7 May 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778160440;
	bh=2zmpjvVUY+07HWWUcCxpxC+7KsaT2l7nu3KqtNlhEY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FDP4jj7NK2NiCJ32H/8JUes7jbtSzWLFGfK7AsuAg3xKx9a9XLBx6xcITj7fe9elr
	 nn1AJZiyKbAz2nTQaS3y7vORVE5ZznA6nDNkYjmAQf5czONfch6VfqDBgplwhuTx91
	 YVMbZ4KxBkCe8BD7ZuaxWPYFh4IpY9M4Vl+yZEsWPh2+ByrQNtF+tHaD09uMr0LC1p
	 aQDU/7/tDx0sjGEC3eEOWyB0DFm0FeIGw/LzfIeIAEoIu/cn9+7YD9dnOVtLb9TNDZ
	 9vReZBbI6lnjaklvwvPLW1NtPExfqcXPftjfDv6IkV66LPFn2fh7SCNYtCZNAIAYbv
	 98NkFHMP1hlCA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20260428135216.100135-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260428135216.100135-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3] mfd: MAINTAINERS: Remove Krzysztof from
 Samsung PMIC drivers
Message-Id: <177816043936.1868182.12796239804738991716.b4-ty@b4>
Date: Thu, 07 May 2026 14:27:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 28 Apr 2026 15:52:16 +0200, Krzysztof Kozlowski wrote:
> Due to lack of time I did not perform reviews of patches for Samsung
> PMIC drivers last year, at least not in timely manner.  I still can
> perform limited testing of the code on hardware, but that does not
> warrant having "M" here.
> 
> Maintainer should be responsive, so drop my name and shift these drivers
> maintenance to André Draszik (from previous reviewer role).
> 
> [...]

Applied, thanks!

[1/1] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC drivers
      commit: e089805df3476e13fd2e5e131373f6712f15222f

--
Lee Jones [李琼斯]

