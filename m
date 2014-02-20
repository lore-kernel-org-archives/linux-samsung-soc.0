From: Dave Airlie <airlied@gmail.com>
Subject: Re: Adding set_blob ioctl to DRM
Date: Thu, 20 Feb 2014 11:24:40 +1000
Message-ID: <CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
References: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Prashanth G <prashanth.g@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

> I am working on enabling a Color Enhancement block for primary display
> for Exynos SoC. I need to
> set a bunch of parameters like Color Conversion matrix, Contrast
> Improvement parameters etc ~ 30 parameters from User Space.
>
> I am planning to use KDS blob property to receive these parameters.
> Currently drivers are not allowed to create a blob property inside
> drm. Neither, user space can set the blob. There is no ioctl provided
> for same.

I don't really like the idea of sticking unstructured data into an
ioctl, for the driver to interpret,

it opens the door to all kinds of ugly driver hacks, so I think we
should have writable blobs,
but with well defined structures inside them, not per-driver ones.

Per-driver structures will lead to binary userspace drivers that start
sticking a pll timings blob on the end and require it to set a mode,
because I know driver developers will abuse any interface in the worst
way possible.

Currently the only blob we really have is EDID and its well defined,
so if we are going to add writable blobs, they need to be well defined
and as little as possible driver specific, just to avoid driver
writings doing what driver writers do.

Dave.
