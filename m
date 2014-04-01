From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 0/4] drm: exynos: Add drivers for MDNIE and IELCD
Date: Tue, 01 Apr 2014 11:23:49 +0200
Message-ID: <533A85A5.4000605@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: seanpaul@google.com, sw0312.kim@samsung.com, joshi@samsung.com, ajaynumb@gmail.com, marcheu@chromium.org, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ajay,

Thanks for the patchset.

On 03/19/2014 03:22 PM, Ajay Kumar wrote:
> This series is based on exynos-drm-next-todo branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> 
> On Exynos SOC, FIMD supports various post processors
> like MIE, MDNIE and IELCD for image enhancement purposes.
> This patchset adds an infrastructure in exynos FIMD to support such
> post procerssors and also adds support routines for MDNIE, and IELCD.


I

> 
> (1) For basic display output,
> 	-- MDNIE and IELCD should have same video timings as FIMD (mode_set)
> 	-- strict power_up/down sequence need to be followed between FIMD,
> 	   MDNIE, and IELCD (power_on, power_off)
> 
> (2) For enhanced display output,
> 	-- MDNIE needs image enhancement data from userspace
> 	   (set_property and set_gamma)
> 
> Rahul Sharma's patchset at:
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27642
> The above patchset is needed to support the enhanced display output.

There should be also patches adding enhanced output support for
exynos_drm framework, I have not found any on dri-devel list.

> 
> MDNIE and IELCD DT nodes are given as phandles to FIMD DT node.

I wonder if it wouldn't be better to use video interface links here,
instead of creating new properties and describing dependency between
them we would just use standard(almost :) ) video links to connect nodes:

FIMD ---> mDNIe ---> IELCD ---> ...
FIMD ---> MIE ---> ...
...

> SOC specific information like base address, clocks and other
> configuration information are extracted via FIMD DT node.

All bindings should be documented in separate patches with device-tree
maintainers added to CC.

It would be nice to have information on which boards it has been tested.
Patches to DTS files of existing boards will be also helpful.

Regards
Andrzej


> 
> Ajay Kumar, Shirish, Rahul Sharma (4):
>   drm: exynos: Add infrastructure to support FIMD post processors
>   drm: exynos: add MDNIE post processor
>   drm: exynos: add IELCD post processor
>   drm: exynos: add MDNIE and IELCD to FIMD pp list
> 
>  drivers/gpu/drm/exynos/Makefile            |   3 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 179 ++++++++
>  drivers/gpu/drm/exynos/exynos_fimd_pp.h    |  54 +++
>  drivers/gpu/drm/exynos/exynos_ielcd.c      | 295 ++++++++++++
>  drivers/gpu/drm/exynos/exynos_mdnie.c      | 707 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_mdnie_regs.h | 154 +++++++
>  include/video/samsung_fimd.h               |  49 +-
>  7 files changed, 1439 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_fimd_pp.h
>  create mode 100644 drivers/gpu/drm/exynos/exynos_ielcd.c
>  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie.c
>  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie_regs.h
> 
