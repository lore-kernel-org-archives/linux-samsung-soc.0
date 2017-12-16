From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] drm: Fix possible deadlock in drm_mode_config_cleanup()
Date: Sat, 16 Dec 2017 12:06:18 +0800
Message-ID: <201712161156.ZrlDcGKV%fengguang.wu@intel.com>
References: <20171213085720.6059-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20171213085720.6059-1-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: linux-samsung-soc@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thierry Escande <thierry.escande@collaboraco.uk>, Shuah Khan <shuahkh@osg.samsung.com>, Mark Brown <broonie@kernel.org>, kbuild-all@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>, Javier Martinez Canillas <javier@dowhile0.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, Matt Hart <matthew.hart@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v4.15-rc3]
[cannot apply to drm/drm-next drm-exynos/exynos-drm/for-next drm-intel/for-linux-next next-20171215]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/drm-Fix-possible-deadlock-in-drm_mode_config_cleanup/20171216-102239
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   include/net/cfg80211.h:3278: warning: Excess enum value 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' description in 'wiphy_flags'
   kernel/sched/core.c:5113: warning: No description found for parameter 't'
   kernel/sched/core.c:5113: warning: Excess function parameter 'interval' description in 'sched_rr_get_interval'
   drivers/gpio/gpiolib.c:601: warning: No description found for parameter '16'
   drivers/gpio/gpiolib.c:601: warning: Excess struct member 'events' description in 'lineevent_state'
   include/linux/iio/iio.h:610: warning: No description found for parameter 'iio_dev'
   include/linux/iio/iio.h:610: warning: Excess function parameter 'indio_dev' description in 'iio_device_register'
   include/linux/iio/trigger.h:79: warning: No description found for parameter 'owner'
   fs/inode.c:1680: warning: No description found for parameter 'rcu'
   include/linux/jbd2.h:443: warning: No description found for parameter 'i_transaction'
   include/linux/jbd2.h:443: warning: No description found for parameter 'i_next_transaction'
   include/linux/jbd2.h:443: warning: No description found for parameter 'i_list'
   include/linux/jbd2.h:443: warning: No description found for parameter 'i_vfs_inode'
   include/linux/jbd2.h:443: warning: No description found for parameter 'i_flags'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_rsv_handle'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_reserved'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_type'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_line_no'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_start_jiffies'
   include/linux/jbd2.h:497: warning: No description found for parameter 'h_requested_credits'
   include/linux/jbd2.h:497: warning: No description found for parameter 'saved_alloc_context'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_chkpt_bhs'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_devname'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_average_commit_time'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_min_batch_time'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_max_batch_time'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_commit_callback'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_failed_commit'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_chksum_driver'
   include/linux/jbd2.h:1050: warning: No description found for parameter 'j_csum_seed'
   fs/jbd2/transaction.c:511: warning: No description found for parameter 'type'
   fs/jbd2/transaction.c:511: warning: No description found for parameter 'line_no'
   fs/jbd2/transaction.c:641: warning: No description found for parameter 'gfp_mask'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_pin'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_unpin'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_res_obj'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_get_sg_table'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_import_sg_table'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_vmap'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_vunmap'
   include/drm/drm_drv.h:594: warning: No description found for parameter 'gem_prime_mmap'
   include/drm/drm_mode_config.h:778: warning: No description found for parameter 'connector_free_works'
   include/drm/drm_mode_config.h:778: warning: No description found for parameter 'connector_free_queue'
   include/drm/drm_mode_config.h:778: warning: No description found for parameter 'modifiers_property'
>> include/drm/drm_mode_config.h:778: warning: Excess struct member 'pending_connector_free_works' description in 'drm_mode_config'
>> include/drm/drm_mode_config.h:778: warning: Excess struct member 'pending_connector_free_queue' description in 'drm_mode_config'
   include/drm/drm_mode_config.h:778: warning: Excess struct member 'modifiers' description in 'drm_mode_config'
   include/drm/drm_plane.h:552: warning: No description found for parameter 'modifiers'
   include/drm/drm_plane.h:552: warning: No description found for parameter 'modifier_count'
   drivers/gpu/drm/drm_edid.c:4837: warning: No description found for parameter 'is_hdmi2_sink'
   drivers/gpu/drm/drm_syncobj.c:306: warning: No description found for parameter 'file_private'
   drivers/gpu/drm/drm_syncobj.c:306: warning: No description found for parameter 'syncobj'
   drivers/gpu/drm/drm_syncobj.c:306: warning: No description found for parameter 'handle'
   drivers/gpu/drm/drm_syncobj.c:307: warning: No description found for parameter 'file_private'
   drivers/gpu/drm/drm_syncobj.c:307: warning: No description found for parameter 'syncobj'
   drivers/gpu/drm/drm_syncobj.c:307: warning: No description found for parameter 'handle'
   drivers/gpu/drm/i915/i915_gem.c:548: warning: No description found for parameter 'rps_client'
   drivers/gpu/drm/i915/i915_gem.c:548: warning: Excess function parameter 'rps' description in 'i915_gem_object_wait'
   Error: Cannot open file drivers/gpu/drm/i915/intel_guc_loader.c
   WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno -function GuC-specific firmware loader drivers/gpu/drm/i915/intel_guc_loader.c' failed with return code 1
   Error: Cannot open file drivers/gpu/drm/i915/intel_guc_loader.c
   Error: Cannot open file drivers/gpu/drm/i915/intel_guc_loader.c
   WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno -internal drivers/gpu/drm/i915/intel_guc_loader.c' failed with return code 2
   drivers/gpu/host1x/bus.c:50: warning: No description found for parameter 'driver'
   drivers/gpu/drm/tve200/tve200_drv.c:1: warning: no structured comments found
   net/core/dev.c:1678: warning: Excess function parameter 'dev' description in 'call_netdevice_notifiers_info'
   net/core/dev.c:6361: warning: No description found for parameter 'extack'
   net/core/dev.c:6384: warning: No description found for parameter 'extack'
   include/linux/rcupdate.h:571: ERROR: Unexpected indentation.
   include/linux/rcupdate.h:575: ERROR: Unexpected indentation.
   include/linux/rcupdate.h:579: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/rcupdate.h:581: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/rcupdate.h:581: WARNING: Inline literal start-string without end-string.
   kernel/time/timer.c:1253: ERROR: Unexpected indentation.
   kernel/time/timer.c:1255: ERROR: Unexpected indentation.
   kernel/time/timer.c:1256: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:110: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:113: ERROR: Unexpected indentation.
   include/linux/wait.h:115: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/time/hrtimer.c:989: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/signal.c:325: WARNING: Inline literal start-string without end-string.
   include/linux/iio/iio.h:219: ERROR: Unexpected indentation.
   include/linux/iio/iio.h:220: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/iio/iio.h:226: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/ata/libata-core.c:5913: ERROR: Unknown target name: "hw".
   drivers/message/fusion/mptbase.c:5051: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/tty/serial/serial_core.c:1899: WARNING: Definition list ends without a blank line; unexpected unindent.
   include/linux/regulator/driver.h:271: ERROR: Unknown target name: "regulator_regmap_x_voltage".
   include/linux/spi/spi.h:373: ERROR: Unexpected indentation.
   drivers/w1/w1_io.c:197: WARNING: Definition list ends without a blank line; unexpected unindent.
   net/core/dev.c:4483: ERROR: Unknown target name: "page_is".
   Documentation/trace/ftrace-uses.rst:53: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/trace/ftrace-uses.rst:89: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/ftrace-uses.rst:89: WARNING: Inline emphasis start-string without end-string.
   Documentation/errseq.rst:: WARNING: document isn't included in any toctree
   Documentation/networking/msg_zerocopy.rst:: WARNING: document isn't included in any toctree
   Documentation/trace/ftrace-uses.rst:: WARNING: document isn't included in any toctree
   Documentation/virtual/kvm/vcpu-requests.rst:: WARNING: document isn't included in any toctree
   Documentation/dev-tools/kselftest.rst:15: WARNING: Could not lex literal_block as "c". Highlighting skipped.
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 43: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 56: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 69: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 82: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 96: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 109: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 122: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 133: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 164: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 193: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 43: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 56: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 69: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 82: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 96: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 109: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 122: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 133: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 164: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 193: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 43: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 56: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 69: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 82: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 96: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 109: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 122: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 133: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 164: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 193: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 43: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 56: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 69: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 82: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 96: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 109: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 122: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 133: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 164: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "~/.fonts.conf", line 193: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 43: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 56: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 69: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 82: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 96: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 109: Having multiple values in <test> isn't supported and may not work as expected
   Fontconfig warning: "/home/kbuild/.config/fontconfig/fonts.conf", line 122: Having multiple values in <test> isn't supported and may not work as expected

vim +778 include/drm/drm_mode_config.h

28575f16 Daniel Vetter 2016-11-14 @778  

:::::: The code at line 778 was first introduced by commit
:::::: 28575f165d36051310d7ea2350e2011f8095b6fb drm: Extract drm_mode_config.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--HlL+5n6rz5pIUxbD
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--HlL+5n6rz5pIUxbD--
