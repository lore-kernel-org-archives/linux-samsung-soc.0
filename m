From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: ARM: EXYNOS: Extend boot loader
 interface documentation
Date: Fri, 10 Jul 2015 14:00:04 -0600
Message-ID: <20150710140004.5b1a8a45@lwn.net>
References: <1436065011-6999-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1436065011-6999-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun,  5 Jul 2015 11:56:51 +0900
Krzysztof Kozlowski <k.kozlowski.k@gmail.com> wrote:

> Extend the kernel-bootloader interface documentation with usage of
> register INFORM1 (0x0804) and different CPU resume address on Exynos542x
> family (with Multi-Cluster Power Management enabled).

I have to assume that the new info here is correct...hopefully somebody
will scream if that's not true.  Applied to the docs tree, thanks.

jon
