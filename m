From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 4/5] exynos4-is: Remove requirement for "simple-bus" compatible
Date: Wed, 16 Apr 2014 10:34:36 -0500
Message-ID: <CAL_Jsq+VRGpVZwFs1QwCz6YY8WmPUO7ZJtWQ3kVY8p1jWe0LGg@mail.gmail.com>
References: <1397583272-28295-1-git-send-email-s.nawrocki@samsung.com>
	<1397583272-28295-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1397583272-28295-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 15, 2014 at 12:34 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch makes the driver instantiating its child devices itself,
> rather than relying on an OS to instantiate devices as children
> of "simple-bus". This removes an incorrect usage of "simple-bus"
> compatible.

Good, but why can't you use of_platform_populate with the root being
the "samsung,fimc" node? The code to instantiate the devices belongs
in the core OF code.

Rob
