From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] regulator: s2mps11: Simplify expression used in BUILD_BUG_ON
Date: Thu, 18 Feb 2016 10:05:06 +0100
Message-ID: <3948917.nk5QvvnR6C@wuerfel>
References: <1455755707-16844-1-git-send-email-k.kozlowski@samsung.com> <20160218014610.GJ10719@samsunx.samsung> <56C522F7.5040109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C522F7.5040109@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jacob.e.keller@intel.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 18 February 2016 10:48:39 Krzysztof Kozlowski wrote:
> 
> Sure, it can be safely removed from s2mps11_info... but it won't affect
> this issue and this patch. Still the local variable would be used in
> probe leading to compiler optimization choices impacting BUILD_BUG_ON.

A local variable probably works fine, I can test that if we think that
would improve the code.

	Arnd
